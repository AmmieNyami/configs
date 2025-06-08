;
; "Imports"
;

;; Functions
(load-file (concat config-directory "pkg.el"))
(load-file (concat config-directory "util.el"))


;; Themes/Autoload
(add-to-list 'load-path
             (concat config-directory
                     (file-name-as-directory "autoload")))

(mapc 'load (file-expand-wildcards
             (concat config-directory
                     (file-name-as-directory "autoload") "*.el")))

(add-to-list 'custom-theme-load-path
             (concat config-directory
                     (file-name-as-directory "themes")))

;
; Custom variables
;

(custom-set-variables
 ;; Stop asking about themes
 '(custom-safe-themes t)

 ;; Remove warnings
 '(warning-minimum-level :error)

 ;; Enable line numbers
 '(display-line-numbers-type 'relative)

 ;; Remove startup screen
 '(inhibit-startup-screen t))

;
; Packages
;

;; Misc packages
(pkg/require
 'magit
 'evil)

;; Language packages
(pkg/require
 'gdscript-mode
 'yaml-mode
 'rust-mode
 'markdown-mode
 'lua-mode
 'csharp-mode
 'go-mode
 'rainbow-mode
 'cmake-mode
 'nim-mode
 'meson-mode
 'typescript-mode)

;; Themes
(pkg/require
 'doom-themes
 'gruber-darker-theme)

;
; GUI stuff/UX
;

;; Set font
(if (eq system-type 'windows-nt)
    (add-to-list 'default-frame-alist '(font . "Consolas 14"))
  (add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font Mono 14")))


;; Set modes
(menu-bar-mode                    0)
(tool-bar-mode                    0)
(scroll-bar-mode                  0)
(column-number-mode               0)
(line-number-mode                 0)
(show-paren-mode                  1)
(global-display-line-numbers-mode 1)

;; Set theme
(util/set-theme 'groover-darker)

;; Tabs and spaces
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; Formatting style
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

;; Whitespace
(pkg/require 'whitespace-cleanup-mode)

(defconst USE-WHITESPACE 1)

(defun set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode USE-WHITESPACE)
  (whitespace-cleanup-mode))

(add-hook 'prog-mode-hook 'set-up-whitespace-handling)

(setq whitespace-style
      (quote
       (face tabs spaces trailing
             space-before-tab newline indentation empty
             space-after-tab space-mark tab-mark)))

;; Dired
(setq dired-listing-switches "-lah --group-directories-first")

;; Disable bell
(setq ring-bell-function 'ignore)

;
; Configure packages
;

;; Elcord
(pkg/require 'elcord)
(elcord-mode)

;; Yasnippets
(pkg/require
 'yasnippet-snippets
 'yasnippet)

(yas-global-mode 1)
(yas-load-directory (concat config-directory
                            (file-name-as-directory "snippets")))

;; Multiple cursors
(pkg/require 'multiple-cursors)

(setq mc/always-run-for-all t)
(global-set-key (kbd "C-x RET RET") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Company mode
(pkg/require 'company)

(global-company-mode)
(add-hook 'tuareg-mode-hook
          (lambda ()
            (interactive)
            (company-mode 0)))

;; lsp-mode
(pkg/require
 'lsp-mode
 'lsp-ui
 'flycheck
 'lsp-treemacs
 'helm-lsp
 'lsp-ivy
 'dap-mode)

(setq lsp-ui-doc-enable nil)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-position 'bottom)

(setq-default lsp-keymap-prefix "C-c l")

(add-hook 'prog-mode-hook #'lsp-deferred)

;; NASM mode
(pkg/require 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.asm?\\'" . nasm-mode))

;; KDL mode
(add-to-list 'auto-mode-alist '("\\.kdl?\\'" . kdl-ts-mode))

;; EditorConfig
(editorconfig-mode 1)

(defun editorconfig-exists ()
  (interactive)
  (eval-and-compile (require 'editorconfig-core))
  (let ((result (editorconfig-core-get-nearest-editorconfig
                 default-directory)))
    (when result t)))

(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda()
                        (interactive)
                        (unless (not (editorconfig-exists))
                          (editorconfig-format-buffer))))))

;; clang-format
(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)
                         (local-set-key (kbd "C-c C-f") 'clang-format-buffer)))

(add-hook 'c++-mode-hook (lambda ()
                           (interactive)
                           (c-toggle-comment-style -1)
                           (local-set-key (kbd "C-c C-f") 'clang-format-buffer)))

;; Prettier
(pkg/require 'prettier-js)

(defun setup-prettier ()
  (prettier-js-mode)
  (prettier-js-mode -1)
  (local-set-key (kbd "C-c C-f") (lambda ()
                                   (interactive)
                                   (prettier-js))))

(add-hook 'js-mode-hook 'setup-prettier)
(add-hook 'html-mode-hook 'setup-prettier)
(add-hook 'css-mode-hook 'setup-prettier)

;
; Keybindings
;

;; Duplicate line
(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'duplicate-line)

;; Compile
(global-set-key (kbd "C-c c") 'compile)

;; Terminal
(global-set-key (kbd "C-`") (lambda()
                              (interactive)
                              (split-window-below)
                              (other-window 1)
                              (term "/bin/zsh")))
