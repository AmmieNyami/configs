#include <dirent.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>

bool is_process_tmux(const char* pid)
{
    char* dst = (char*)malloc(256);
    memset(dst, 0, 256);
    strcat(dst, "/proc/");
    strcat(dst, pid);
    strcat(dst, "/cmdline");

    FILE* file = fopen(dst, "r");
    if (file == NULL) {
        fprintf(stderr, "ERROR: failed to open file `%s` for reading: %s\n",
                dst, strerror(errno));
        return false;
    }
    char tmux[4];
    fread(tmux, sizeof(tmux), sizeof(tmux[0]), file);
    fclose(file);

    free(dst);

    return strncmp(tmux, "tmux", 4) == 0;
}

bool is_tmux_running(void)
{
    DIR* directory = opendir("/proc");
    if (!directory) {
        fprintf(stderr, "ERROR: failed to open directory `/proc`: %s\n",
                strerror(errno));
        return false;
    }

    while (directory) {
        struct dirent* dir_entry = readdir(directory);
        if (!dir_entry) break;
        if (is_process_tmux(dir_entry->d_name)) {
            closedir(directory);
            return true;
        }
    }

    closedir(directory);

    return false;
}

bool execute_shell_command(char* command, char *const envp[], const char* workdir)
{
    pid_t pid = fork();
    if (pid < 0) {
        fprintf(stderr, "ERROR: failed to fork process\n");
        return false;
    }

    if (pid == 0) {
        char* shell = "/bin/sh";
        char* const args[] = {shell, "-c", command, NULL};
        chdir(workdir);

        if (execve(shell, args, envp) == -1) {
            fprintf(stderr, "ERROR: failed to execute shell command `%s`: %s\n",
                    shell, strerror(errno));
            exit(1);
        }

        fprintf(stderr, "Unreachable code\n");
        abort();
    }

    if (waitpid(pid, NULL, 0) == -1) {
        fprintf(stderr, "ERROR: failed to wait for shell command to finish executing: %s\n",
                strerror(errno));
        return false;
    }

    return true;
}

int main(int argc, const char** argv, char** const envp)
{
    (void) argc;
    (void) argv;

    if (is_tmux_running()) {
        printf("[INFO] tmux is running, connecting to existing session\n");
        if (!execute_shell_command("alacritty -e tmux a", envp, "/home/hatsu/Home"))
            return 1;
    } else {
        printf("[INFO] tmux is not running, creating a new session\n");
        if (!execute_shell_command("alacritty -e tmux", envp, "/home/hatsu/Home"))
            return 1;
    }

    return 0;
}
