;;; groover-darker-theme.el --- Groover Darker color theme for Emacs 24.

;; Copyright (C) 2024 Hatsu Sixty
;; Copyright (C) 2013-2016 Alexey Kutepov a.k.a rexim
;; Copyright (C) 2009-2010 Jason R. Blevins

;; Author: Hatsu Sixty <hatsunotsus@gmail.com>
;; URL: https://github.com/HatsuSixty/groover-darker-theme
;; Version: 0.1

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:
;;
;; Groover Darker color theme for Emacs by Hatsu Sixty. Based on Alexey
;; Kutepov a.k.a. rexim's adptation of Jason Blevins' Gruber Darker
;; theme.

(deftheme groover-darker
  "Groover Darker color theme for Emacs 24")

;; Please, install rainbow-mode.
;; Colors with +x are lighter. Colors with -x are darker.
(let ((groover-darker-fg        "#e4e4ef")
      (groover-darker-fg+1      "#f4f4ff")
      (groover-darker-fg+2      "#f5f5f5")
      (groover-darker-white     "#ffffff")
      (groover-darker-black     "#000000")
      (groover-darker-bg-1      "#101010")
      (groover-darker-bg        "#181818")
      (groover-darker-bg+1      "#282828")
      (groover-darker-bg+2      "#453d41")
      (groover-darker-bg+3      "#484848")
      (groover-darker-bg+4      "#52494e")
      (groover-darker-red-1     "#c73c3f")
      (groover-darker-red       "#f43841")
      (groover-darker-red+1     "#ff4f58")
      (groover-darker-pink      "#ff85ff")
      (groover-darker-purple    "#d072ff")
      (groover-darker-green     "#73c936")
      (groover-darker-yellow    "#ffdd33")
      (groover-darker-brown     "#cc8c3c")
      (groover-darker-quartz    "#95a99f")
      (groover-darker-niagara-2 "#303540")
      (groover-darker-niagara-1 "#565f73")
      (groover-darker-niagara   "#96a6c8")
      (groover-darker-wisteria  "#9e95c7")
      )
  (custom-theme-set-variables
   'groover-darker
   '(frame-brackground-mode (quote dark)))

  (custom-theme-set-faces
   'groover-darker

   ;; Agda2
   `(agda2-highlight-datatype-face ((t (:foreground ,groover-darker-quartz))))
   `(agda2-highlight-primitive-type-face ((t (:foreground ,groover-darker-quartz))))
   `(agda2-highlight-function-face ((t (:foreground ,groover-darker-niagara))))
   `(agda2-highlight-keyword-face ((t ,(list :foreground groover-darker-pink
                                             :bold t))))
   `(agda2-highlight-inductive-constructor-face ((t (:foreground ,groover-darker-green))))
   `(agda2-highlight-number-face ((t (:foreground ,groover-darker-wisteria))))

   ;; AUCTeX
   `(font-latex-bold-face ((t (:foreground ,groover-darker-quartz :bold t))))
   `(font-latex-italic-face ((t (:foreground ,groover-darker-quartz :italic t))))
   `(font-latex-math-face ((t (:foreground ,groover-darker-green))))
   `(font-latex-sectioning-5-face ((t ,(list :foreground groover-darker-niagara
                                             :bold t))))
   `(font-latex-slide-title-face ((t (:foreground ,groover-darker-niagara))))
   `(font-latex-string-face ((t (:foreground ,groover-darker-green))))
   `(font-latex-warning-face ((t (:foreground ,groover-darker-red))))

   ;; Basic Coloring (or Uncategorized)
   `(border ((t ,(list :background groover-darker-bg-1
                       :foreground groover-darker-bg+2))))
   `(cursor ((t (:background ,groover-darker-pink))))
   `(default ((t ,(list :foreground groover-darker-fg
                        :background groover-darker-bg))))
   `(fringe ((t ,(list :background nil
                       :foreground groover-darker-bg+2))))
   `(vertical-border ((t ,(list :foreground groover-darker-bg+2))))
   `(link ((t (:foreground ,groover-darker-niagara :underline t))))
   `(link-visited ((t (:foreground ,groover-darker-wisteria :underline t))))
   `(match ((t (:background ,groover-darker-bg+4))))
   `(shadow ((t (:foreground ,groover-darker-bg+4))))
   `(minibuffer-prompt ((t (:foreground ,groover-darker-niagara))))
   `(region ((t (:background ,groover-darker-bg+3 :foreground ,groover-darker-white))))
   `(secondary-selection ((t ,(list :background groover-darker-bg+3
                                    :foreground nil))))
   `(trailing-whitespace ((t ,(list :foreground groover-darker-black
                                    :background groover-darker-red))))
   `(tooltip ((t ,(list :background groover-darker-bg+4
                        :foreground groover-darker-white))))

   ;; Calendar
   `(holiday-face ((t (:foreground ,groover-darker-red))))

   ;; Compilation
   `(compilation-info ((t ,(list :foreground groover-darker-green
                                 :inherit 'unspecified))))
   `(compilation-warning ((t ,(list :foreground groover-darker-brown
                                    :bold t
                                    :inherit 'unspecified))))
   `(compilation-error ((t (:foreground ,groover-darker-red+1))))
   `(compilation-mode-line-fail ((t ,(list :foreground groover-darker-red
                                           :weight 'bold
                                           :inherit 'unspecified))))
   `(compilation-mode-line-exit ((t ,(list :foreground groover-darker-green
                                           :weight 'bold
                                           :inherit 'unspecified))))

   ;; Completion
   `(completions-annotations ((t (:inherit 'shadow))))

   ;; Custom
   `(custom-state ((t (:foreground ,groover-darker-green))))

   ;; Diff
   `(diff-removed ((t ,(list :foreground groover-darker-red+1
                             :background nil))))
   `(diff-added ((t ,(list :foreground groover-darker-green
                           :background nil))))

   ;; Dired
   `(dired-directory ((t (:foreground ,groover-darker-niagara :weight bold))))
   `(dired-ignored ((t ,(list :foreground groover-darker-quartz
                              :inherit 'unspecified))))

   ;; Ebrowse
   `(ebrowse-root-class ((t (:foreground ,groover-darker-niagara :weight bold))))
   `(ebrowse-progress ((t (:background ,groover-darker-niagara))))

   ;; Egg
   `(egg-branch ((t (:foreground ,groover-darker-yellow))))
   `(egg-branch-mono ((t (:foreground ,groover-darker-yellow))))
   `(egg-diff-add ((t (:foreground ,groover-darker-green))))
   `(egg-diff-del ((t (:foreground ,groover-darker-red))))
   `(egg-diff-file-header ((t (:foreground ,groover-darker-wisteria))))
   `(egg-help-header-1 ((t (:foreground ,groover-darker-yellow))))
   `(egg-help-header-2 ((t (:foreground ,groover-darker-niagara))))
   `(egg-log-HEAD-name ((t (:box (:color ,groover-darker-fg)))))
   `(egg-reflog-mono ((t (:foreground ,groover-darker-niagara-1))))
   `(egg-section-title ((t (:foreground ,groover-darker-yellow))))
   `(egg-text-base ((t (:foreground ,groover-darker-fg))))
   `(egg-term ((t (:foreground ,groover-darker-yellow))))

   ;; ERC
   `(erc-notice-face ((t (:foreground ,groover-darker-wisteria))))
   `(erc-timestamp-face ((t (:foreground ,groover-darker-green))))
   `(erc-input-face ((t (:foreground ,groover-darker-red+1))))
   `(erc-my-nick-face ((t (:foreground ,groover-darker-red+1))))

   ;; EShell
   `(eshell-ls-backup ((t (:foreground ,groover-darker-quartz))))
   `(eshell-ls-directory ((t (:foreground ,groover-darker-niagara))))
   `(eshell-ls-executable ((t (:foreground ,groover-darker-green))))
   `(eshell-ls-symlink ((t (:foreground ,groover-darker-pink))))

   ;; Font Lock
   `(font-lock-builtin-face ((t (:foreground ,groover-darker-purple))))
   `(font-lock-comment-face ((t (:foreground ,groover-darker-brown))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,groover-darker-brown))))
   `(font-lock-constant-face ((t (:foreground ,groover-darker-quartz))))
   `(font-lock-doc-face ((t (:foreground ,groover-darker-green))))
   `(font-lock-doc-string-face ((t (:foreground ,groover-darker-green))))
   `(font-lock-function-name-face ((t (:foreground ,groover-darker-niagara))))
   `(font-lock-keyword-face ((t (:foreground ,groover-darker-pink :bold t))))
   `(font-lock-preprocessor-face ((t (:foreground ,groover-darker-quartz))))
   `(font-lock-reference-face ((t (:foreground ,groover-darker-quartz))))
   `(font-lock-string-face ((t (:foreground ,groover-darker-green))))
   `(font-lock-type-face ((t (:foreground ,groover-darker-quartz))))
   `(font-lock-variable-name-face ((t (:foreground ,groover-darker-fg+1))))
   `(font-lock-warning-face ((t (:foreground ,groover-darker-red))))

   ;; Flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,groover-darker-red)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:foreground ,groover-darker-red :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,groover-darker-yellow)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,groover-darker-yellow :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,groover-darker-green)
                   :foreground unspecified
                   :background unspecified
                   :inherit unspecified))
      (t (:forground ,groover-darker-green :weight bold :underline t))))

   ;; Flyspell
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,groover-darker-red) :inherit unspecified))
      (t (:foreground ,groover-darker-red :weight bold :underline t))))
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,groover-darker-yellow) :inherit unspecified))
      (t (:foreground ,groover-darker-yellow :weight bold :underline t))))

   ;; Helm
   `(helm-candidate-number ((t ,(list :background groover-darker-bg+2
                                      :foreground groover-darker-yellow
                                      :bold t))))
   `(helm-ff-directory ((t ,(list :foreground groover-darker-niagara
                                  :background groover-darker-bg
                                  :bold t))))
   `(helm-ff-executable ((t (:foreground ,groover-darker-green))))
   `(helm-ff-file ((t (:foreground ,groover-darker-fg :inherit unspecified))))
   `(helm-ff-invalid-symlink ((t ,(list :foreground groover-darker-bg
                                        :background groover-darker-red))))
   `(helm-ff-symlink ((t (:foreground ,groover-darker-yellow :bold t))))
   `(helm-selection-line ((t (:background ,groover-darker-bg+1))))
   `(helm-selection ((t (:background ,groover-darker-bg+1 :underline nil))))
   `(helm-source-header ((t ,(list :foreground groover-darker-yellow
                                   :background groover-darker-bg
                                   :box (list :line-width -1
                                              :style 'released-button)))))

   ;; Ido
   `(ido-first-match ((t (:foreground ,groover-darker-yellow :bold nil))))
   `(ido-only-match ((t (:foreground ,groover-darker-brown :weight bold))))
   `(ido-subdir ((t (:foreground ,groover-darker-niagara :weight bold))))

   ;; Info
   `(info-xref ((t (:foreground ,groover-darker-niagara))))
   `(info-visited ((t (:foreground ,groover-darker-wisteria))))

   ;; Jabber
   `(jabber-chat-prompt-foreign ((t ,(list :foreground groover-darker-quartz
                                           :bold nil))))
   `(jabber-chat-prompt-local ((t (:foreground ,groover-darker-yellow))))
   `(jabber-chat-prompt-system ((t (:foreground ,groover-darker-green))))
   `(jabber-rare-time-face ((t (:foreground ,groover-darker-green))))
   `(jabber-roster-user-online ((t (:foreground ,groover-darker-green))))
   `(jabber-activity-face ((t (:foreground ,groover-darker-red))))
   `(jabber-activity-personal-face ((t (:foreground ,groover-darker-yellow :bold t))))

   ;; Line Highlighting
   `(highlight ((t (:background ,groover-darker-bg+1 :foreground nil))))
   `(highlight-current-line-face ((t ,(list :background groover-darker-bg+1
                                            :foreground nil))))

   ;; line numbers
   `(line-number ((t (:inherit default :foreground ,groover-darker-bg+4))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,groover-darker-pink))))

   ;; Linum
   `(linum ((t `(list :foreground groover-darker-quartz
                      :background groover-darker-bg))))

   ;; Magit
   `(magit-branch ((t (:foreground ,groover-darker-niagara))))
   `(magit-diff-hunk-header ((t (:background ,groover-darker-bg+2))))
   `(magit-diff-file-header ((t (:background ,groover-darker-bg+4))))
   `(magit-log-sha1 ((t (:foreground ,groover-darker-red+1))))
   `(magit-log-author ((t (:foreground ,groover-darker-brown))))
   `(magit-log-head-label-remote ((t ,(list :foreground groover-darker-green
                                            :background groover-darker-bg+1))))
   `(magit-log-head-label-local ((t ,(list :foreground groover-darker-niagara
                                           :background groover-darker-bg+1))))
   `(magit-log-head-label-tags ((t ,(list :foreground groover-darker-yellow
                                          :background groover-darker-bg+1))))
   `(magit-log-head-label-head ((t ,(list :foreground groover-darker-fg
                                          :background groover-darker-bg+1))))
   `(magit-item-highlight ((t (:background ,groover-darker-bg+1))))
   `(magit-tag ((t ,(list :foreground groover-darker-yellow
                          :background groover-darker-bg))))
   `(magit-blame-heading ((t ,(list :background groover-darker-bg+1
                                    :foreground groover-darker-fg))))

   ;; Message
   `(message-header-name ((t (:foreground ,groover-darker-green))))

   ;; Mode Line
   `(mode-line ((t ,(list :background groover-darker-bg+1
                          :foreground groover-darker-white))))
   `(mode-line-buffer-id ((t ,(list :background groover-darker-bg+1
                                    :foreground groover-darker-white))))
   `(mode-line-inactive ((t ,(list :background groover-darker-bg+1
                                   :foreground groover-darker-quartz))))

   ;; Neo Dir
   `(neo-dir-link-face ((t (:foreground ,groover-darker-niagara))))

   ;; Org Mode
   `(org-agenda-structure ((t (:foreground ,groover-darker-niagara))))
   `(org-column ((t (:background ,groover-darker-bg-1))))
   `(org-column-title ((t (:background ,groover-darker-bg-1 :underline t :weight bold))))
   `(org-done ((t (:foreground ,groover-darker-green))))
   `(org-todo ((t (:foreground ,groover-darker-red-1))))
   `(org-upcoming-deadline ((t (:foreground ,groover-darker-yellow))))

   ;; Search
   `(isearch ((t ,(list :foreground groover-darker-black
                        :background groover-darker-fg+2))))
   `(isearch-fail ((t ,(list :foreground groover-darker-black
                             :background groover-darker-red))))
   `(isearch-lazy-highlight-face ((t ,(list
                                       :foreground groover-darker-fg+1
                                       :background groover-darker-niagara-1))))

   ;; Sh
   `(sh-quoted-exec ((t (:foreground ,groover-darker-red+1))))

   ;; Show Paren
   `(show-paren-match-face ((t (:background ,groover-darker-bg+4))))
   `(show-paren-mismatch-face ((t (:background ,groover-darker-red-1))))

   ;; Slime
   `(slime-repl-inputed-output-face ((t (:foreground ,groover-darker-red))))

   ;; Tuareg
   `(tuareg-font-lock-governing-face ((t (:foreground ,groover-darker-yellow))))

   ;; Speedbar
   `(speedbar-directory-face ((t ,(list :foreground groover-darker-niagara
                                        :weight 'bold))))
   `(speedbar-file-face ((t (:foreground ,groover-darker-fg))))
   `(speedbar-highlight-face ((t (:background ,groover-darker-bg+1))))
   `(speedbar-selected-face ((t (:foreground ,groover-darker-red))))
   `(speedbar-tag-face ((t (:foreground ,groover-darker-yellow))))

   ;; Which Function
   `(which-func ((t (:foreground ,groover-darker-wisteria))))

   ;; Whitespace
   `(whitespace-space ((t ,(list :background groover-darker-bg
                                 :foreground groover-darker-bg+1))))
   `(whitespace-tab ((t ,(list :background groover-darker-bg
                               :foreground groover-darker-bg+1))))
   `(whitespace-hspace ((t ,(list :background groover-darker-bg
                                  :foreground groover-darker-bg+2))))
   `(whitespace-line ((t ,(list :background groover-darker-bg+2
                                :foreground groover-darker-red+1))))
   `(whitespace-newline ((t ,(list :background groover-darker-bg
                                   :foreground groover-darker-bg+2))))
   `(whitespace-trailing ((t ,(list :background groover-darker-red
                                    :foreground groover-darker-red))))
   `(whitespace-empty ((t ,(list :background groover-darker-pink
                                 :foreground groover-darker-pink))))
   `(whitespace-indentation ((t ,(list :background groover-darker-pink
                                       :foreground groover-darker-red))))
   `(whitespace-space-after-tab ((t ,(list :background groover-darker-pink
                                           :foreground groover-darker-pink))))
   `(whitespace-space-before-tab ((t ,(list :background groover-darker-brown
                                            :foreground groover-darker-brown))))

   ;; tab-bar
   `(tab-bar ((t (:background ,groover-darker-bg+1 :foreground ,groover-darker-bg+4))))
   `(tab-bar-tab ((t (:background nil :foreground ,groover-darker-yellow :weight bold))))
   `(tab-bar-tab-inactive ((t (:background nil))))

   ;; vterm / ansi-term
   `(term-color-black ((t (:foreground ,groover-darker-bg+3 :background ,groover-darker-bg+4))))
   `(term-color-red ((t (:foreground ,groover-darker-red-1 :background ,groover-darker-red-1))))
   `(term-color-green ((t (:foreground ,groover-darker-green :background ,groover-darker-green))))
   `(term-color-blue ((t (:foreground ,groover-darker-niagara :background ,groover-darker-niagara))))
   `(term-color-yellow ((t (:foreground ,groover-darker-yellow :background ,groover-darker-yellow))))
   `(term-color-magenta ((t (:foreground ,groover-darker-wisteria :background ,groover-darker-wisteria))))
   `(term-color-cyan ((t (:foreground ,groover-darker-quartz :background ,groover-darker-quartz))))
   `(term-color-white ((t (:foreground ,groover-darker-fg :background ,groover-darker-white))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,groover-darker-fg :background ,groover-darker-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,groover-darker-brown :background ,groover-darker-bg+1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,groover-darker-brown :background ,groover-darker-bg-1))))
   `(company-tooltip-selection ((t (:foreground ,groover-darker-fg :background ,groover-darker-bg-1))))
   `(company-tooltip-mouse ((t (:background ,groover-darker-bg-1))))
   `(company-tooltip-common ((t (:foreground ,groover-darker-green))))
   `(company-tooltip-common-selection ((t (:foreground ,groover-darker-green))))
   `(company-scrollbar-fg ((t (:background ,groover-darker-bg-1))))
   `(company-scrollbar-bg ((t (:background ,groover-darker-bg+2))))
   `(company-preview ((t (:background ,groover-darker-green))))
   `(company-preview-common ((t (:foreground ,groover-darker-green :background ,groover-darker-bg-1))))

   ;; Proof General
   `(proof-locked-face ((t (:background ,groover-darker-niagara-2))))

   ;; Orderless
   `(orderless-match-face-0 ((t (:foreground ,groover-darker-yellow))))
   `(orderless-match-face-1 ((t (:foreground ,groover-darker-green))))
   `(orderless-match-face-2 ((t (:foreground ,groover-darker-brown))))
   `(orderless-match-face-3 ((t (:foreground ,groover-darker-quartz))))
   ))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'groover-darker)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (fboundp 'rainbow-mode) (rainbow-mode +1))
;; End:

;;; groover-darker-theme.el ends here.
