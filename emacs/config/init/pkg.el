(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(defvar pkg/package-contents-refreshed nil)

(defun pkg/package-refresh-contents-once ()
  (when (not pkg/package-contents-refreshed)
    (setq pkg/package-contents-refreshed t)
    (package-refresh-contents)))

(defun pkg/require (&rest packages)
  (dolist (package packages)
    (when (not (package-installed-p package))
      (pkg/package-refresh-contents-once)
      (package-install package))))

(pkg/require 'dash)
(require 'dash)

(pkg/require 'dash-functional)
(require 'dash-functional)
