;;; sonokai-shusia-theme.el --- Sonokai Shusia Theme  -*- lexical-binding: t; -*-

;; Copyright (C) 2024 Hatsu Sixty
;; Copyright (C) 2023 Alexander Chan

;; Author: Hatsu Sixty <hatsunotsus@gmail.com>
;; Original Author: Alexander Chan
;; URL: https://github.com/HatsuSixty/sonokai-shusia-emacs
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
;; Sonokai Shusia color theme for Emacs by Hatsu Sixty. Based on
;; Alexander Chan's adaptation of the default Sonokai color theme.

;; Sonokai Shusia Palette
;;          reg     dim     bright  alt
;; yellow:  #E5C463 #B79C4F #FFD251 #C4A64F
;; orange:  #EF9061 #BF734E #FF854A
;; red:     #F85D84 #C64B69 #FF406F
;; magenta: #DC8CC3 #B0709B #FF8FDC
;; blue:    #7ACCD7 #61A3AC #7AEFFF
;; green:   #9ECD6F #7EA458 #B2F66E #A7DF78
;; cyan:    #85D2F2 #6AA8C1 #75D7FF
;; violet:  #AA9DF2 #887DC1 #A593FF
;; gray:    #848089 #69666D #9D97A4
;; black:   #181819 #101010 #282828
;; white:   #E2E2E3 #BfBFBF #F0F0F0
;; bg:      #2D2A2E #242124 #353137
;; bg-alt:  #413C45 #343037 #4D4355
;; d-red:   #55393D #482F32 #906369
;; d-blue:  #354157 #2B3649 #5B6F92
;; d-green: #394634 #2F3B2B #6D8464

;;; Code:

(unless (>= emacs-major-version 27)
  (error "The Sonokai Shusia theme requires Emacs 27 or later!"))

(deftheme sonokai-shusia "The Sonokai Shusia color theme.")

(defgroup sonokai-shusia nil
  "Sonokai Shusia theme options.
The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom sonokai-shusia-use-variable-pitch nil
  "Use variable pitch face for some headings and titles."
  :type 'boolean
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-doc-face-as-comment nil
  "Consider `font-lock-doc-face' as comment instead of a string."
  :type 'boolean
  :group 'sonokai-shusia
  :package-version "3.5.1")

(defcustom sonokai-shusia-height-minus-1 0.8
  "Font size -1."
  :type 'number
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-height-plus-1 1.1
  "Font size +1."
  :type 'number
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-height-plus-2 1.15
  "Font size +2."
  :type 'number
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-height-plus-3 1.2
  "Font size +3."
  :type 'number
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-height-plus-4 1.3
  "Font size +4."
  :type 'number
  :group 'sonokai-shusia)

;; Primary colors
(defcustom sonokai-shusia-yellow "#E5C463"
  "Primary colors - yellow."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-orange "#EF9061"
  "Primary colors - orange."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-red "#F85D84"
  "Primary colors - red."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-magenta "#DC8CC3"
  "Primary colors - magenta."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-blue "#7ACCD7"
  "Primary colors - blue."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-green "#9ECD6F"
  "Primary colors - green."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-cyan "#85D2F2"
  "Primary colors - cyan."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-violet "#AA9DF2"
  "Primary colors - violet."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-gray "#848089"
  "Primary colors - gray."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-white "#E2E2E3"
  "Primary colors - white."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-black "#181819"
  "Primary colors - black."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-foreground "#E2E2E3"
  "Adaptive colors - foreground."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-background "#2D2A2E"
  "Adaptive colors - background."
  :type 'string
  :group 'sonokai-shusia)

(defcustom sonokai-shusia-background-alt "#4D4355"
  "Adaptive colors - background alt."
  :type 'string
  :group 'sonokai-shusia)

(let* (;; Variable pitch
       (sonokai-shusia-pitch (if sonokai-shusia-use-variable-pitch
                                 'variable-pitch
                               'default))

       ;; Definitions for guis that support 256 colors
       (sonokai-shusia-class '((class color) (min-colors 257)))

       ;; Functionality specific colors
       (sonokai-shusia-diff-blue-base      "#354157")
       (sonokai-shusia-diff-blue-alt       "#2B3649")
       (sonokai-shusia-diff-blue-emphasis  "#5B6F92")
       (sonokai-shusia-diff-green-base     "#394634")
       (sonokai-shusia-diff-green-alt      "#2F3B2B")
       (sonokai-shusia-diff-green-emphasis "#6D8464")
       (sonokai-shusia-diff-red-base       "#55393D")
       (sonokai-shusia-diff-red-alt        "#482F32")
       (sonokai-shusia-diff-red-emphasis   "#906369")

       ;; Darker and lighter accented colors
       (sonokai-shusia-yellow-d       "#B79C4F")
       (sonokai-shusia-yellow-l       "#FFD251")
       (sonokai-shusia-orange-d       "#BF734E")
       (sonokai-shusia-orange-l       "#FF854A")
       (sonokai-shusia-red-d          "#C64B69")
       (sonokai-shusia-red-l          "#FF406F")
       (sonokai-shusia-magenta-d      "#B0709B")
       (sonokai-shusia-magenta-l      "#FF8FDC")
       (sonokai-shusia-violet-d       "#887DC1")
       (sonokai-shusia-violet-l       "#A593FF")
       (sonokai-shusia-blue-d         "#61A3AC")
       (sonokai-shusia-blue-l         "#7AEFFF")
       (sonokai-shusia-cyan-d         "#6AA8C1")
       (sonokai-shusia-cyan-l         "#75D7FF")
       (sonokai-shusia-green-d        "#7EA458")
       (sonokai-shusia-green-l        "#B2F66E")
       (sonokai-shusia-gray-d         "#69666D")
       (sonokai-shusia-gray-l         "#9D97A4")
       (sonokai-shusia-black-d        "#101010")
       (sonokai-shusia-black-l        "#282828")
       (sonokai-shusia-white-d        "#BFBFBF")
       (sonokai-shusia-white-l        "#F0F0F0")
       (sonokai-shusia-background-d   "#242124")
       (sonokai-shusia-background-l   "#353137")
       (sonokai-shusia-bg-alt-d       "#343037")
       (sonokai-shusia-bg-alt-l       "#4D4355")

       ;; Adaptive colors
       (sonokai-shusia-comments       sonokai-shusia-gray)
       (sonokai-shusia-emphasis       sonokai-shusia-white)
       (sonokai-shusia-line-number    sonokai-shusia-gray-d)
       (sonokai-shusia-highlight      sonokai-shusia-bg-alt-l)
       (sonokai-shusia-highlight-alt  sonokai-shusia-background-alt)
       (sonokai-shusia-highlight-line sonokai-shusia-bg-alt-d)

       ;; Adaptive higher/lower contrast accented colors
       (sonokai-shusia-foreground-hc  sonokai-shusia-black-d)
       (sonokai-shusia-foreground-lc  sonokai-shusia-black-l)

       ;; High contrast colors
       (sonokai-shusia-yellow-hc      sonokai-shusia-yellow-d)
       (sonokai-shusia-yellow-hc-alt  "#C4A64F")
       (sonokai-shusia-yellow-lc      sonokai-shusia-yellow-l)
       (sonokai-shusia-orange-hc      sonokai-shusia-orange-d)
       (sonokai-shusia-orange-lc      sonokai-shusia-orange-l)
       (sonokai-shusia-red-hc         sonokai-shusia-red-d)
       (sonokai-shusia-red-hc-alt     "#D84A5F")
       (sonokai-shusia-red-lc         sonokai-shusia-red-l)
       (sonokai-shusia-magenta-hc     sonokai-shusia-magenta-d)
       (sonokai-shusia-magenta-lc     sonokai-shusia-magenta-l)
       (sonokai-shusia-violet-hc      sonokai-shusia-violet-d)
       (sonokai-shusia-violet-lc      sonokai-shusia-violet-l)
       (sonokai-shusia-blue-hc        sonokai-shusia-blue-d)
       (sonokai-shusia-blue-lc        sonokai-shusia-blue-l)
       (sonokai-shusia-cyan-hc        sonokai-shusia-cyan-d)
       (sonokai-shusia-cyan-lc        sonokai-shusia-cyan-l)
       (sonokai-shusia-green-hc       sonokai-shusia-green-d)
       (sonokai-shusia-green-hc-alt   "#A7DF78")
       (sonokai-shusia-green-lc       sonokai-shusia-green-l)

       ;; Fringe
       (sonokai-shusia-fringe-bg sonokai-shusia-background)

       ;; Definitions for terminals that do not support 256 colors
       (sonokai-shusia-256-class '((class color) (min-colors 89)))

       ;; Functionality specific colors
       (sonokai-shusia-256-diff-blue-base      sonokai-shusia-diff-blue-base)
       (sonokai-shusia-256-diff-blue-alt       sonokai-shusia-diff-blue-alt)
       (sonokai-shusia-256-diff-blue-emphasis  sonokai-shusia-diff-blue-emphasis)
       (sonokai-shusia-256-diff-green-base     sonokai-shusia-diff-green-base)
       (sonokai-shusia-256-diff-green-alt      sonokai-shusia-diff-green-alt)
       (sonokai-shusia-256-diff-green-emphasis sonokai-shusia-diff-green-emphasis)
       (sonokai-shusia-256-diff-red-base       sonokai-shusia-diff-red-base)
       (sonokai-shusia-256-diff-red-alt        sonokai-shusia-diff-red-alt)
       (sonokai-shusia-256-diff-red-emphasis   sonokai-shusia-diff-red-emphasis)

       ;; Primary colors
       (sonokai-shusia-256-yellow         sonokai-shusia-yellow)
       (sonokai-shusia-256-orange         sonokai-shusia-orange)
       (sonokai-shusia-256-red            sonokai-shusia-red)
       (sonokai-shusia-256-magenta        sonokai-shusia-magenta)
       (sonokai-shusia-256-violet         sonokai-shusia-violet)
       (sonokai-shusia-256-blue           sonokai-shusia-blue)
       (sonokai-shusia-256-cyan           sonokai-shusia-cyan)
       (sonokai-shusia-256-green          sonokai-shusia-green)
       (sonokai-shusia-256-gray           sonokai-shusia-gray)

       ;; Darker and lighter accented colors
       (sonokai-shusia-256-yellow-d       sonokai-shusia-yellow-d)
       (sonokai-shusia-256-yellow-l       sonokai-shusia-yellow-l)
       (sonokai-shusia-256-orange-d       sonokai-shusia-orange-d)
       (sonokai-shusia-256-orange-l       sonokai-shusia-orange-l)
       (sonokai-shusia-256-red-d          sonokai-shusia-red-d)
       (sonokai-shusia-256-red-l          sonokai-shusia-red-l)
       (sonokai-shusia-256-magenta-d      sonokai-shusia-magenta-d)
       (sonokai-shusia-256-magenta-l      sonokai-shusia-magenta-l)
       (sonokai-shusia-256-violet-d       sonokai-shusia-violet-d)
       (sonokai-shusia-256-violet-l       sonokai-shusia-violet-l)
       (sonokai-shusia-256-blue-d         sonokai-shusia-blue-d)
       (sonokai-shusia-256-blue-l         sonokai-shusia-blue-l)
       (sonokai-shusia-256-cyan-d         sonokai-shusia-cyan-d)
       (sonokai-shusia-256-cyan-l         sonokai-shusia-cyan-l)
       (sonokai-shusia-256-green-d        sonokai-shusia-green-d)
       (sonokai-shusia-256-green-l        sonokai-shusia-green-l)
       (sonokai-shusia-256-gray-d         sonokai-shusia-gray-d)
       (sonokai-shusia-256-gray-l         sonokai-shusia-gray-l)
       (sonokai-shusia-256-black-d        sonokai-shusia-black-d)
       (sonokai-shusia-256-black-l        sonokai-shusia-black-l)
       (sonokai-shusia-256-white-d        sonokai-shusia-white-d)
       (sonokai-shusia-256-white-l        sonokai-shusia-white-l)

       ;; Adaptive colors
       (sonokai-shusia-256-foreground     sonokai-shusia-foreground)
       (sonokai-shusia-256-background     sonokai-shusia-background)
       (sonokai-shusia-256-background-d   sonokai-shusia-background-d)
       (sonokai-shusia-256-background-l   sonokai-shusia-background-l)
       (sonokai-shusia-256-background-alt sonokai-shusia-background-alt)
       (sonokai-shusia-256-bg-alt-d       sonokai-shusia-bg-alt-d)
       (sonokai-shusia-256-bg-alt-l       sonokai-shusia-bg-alt-l)
       (sonokai-shusia-256-comments       sonokai-shusia-comments)
       (sonokai-shusia-256-emphasis       sonokai-shusia-emphasis)
       (sonokai-shusia-256-line-number    sonokai-shusia-line-number)
       (sonokai-shusia-256-highlight      sonokai-shusia-highlight)
       (sonokai-shusia-256-highlight-alt  sonokai-shusia-highlight-alt)
       (sonokai-shusia-256-highlight-line sonokai-shusia-highlight-line)

       ;; Adaptive higher/lower contrast accented colors
       (sonokai-shusia-256-foreground-hc  sonokai-shusia-black-d)
       (sonokai-shusia-256-foreground-lc  sonokai-shusia-black-l)

       ;; High contrast colors
       (sonokai-shusia-256-yellow-hc      sonokai-shusia-256-yellow-d)
       (sonokai-shusia-256-yellow-lc      sonokai-shusia-256-yellow-l)
       (sonokai-shusia-256-orange-hc      sonokai-shusia-256-orange-d)
       (sonokai-shusia-256-orange-lc      sonokai-shusia-256-orange-l)
       (sonokai-shusia-256-red-hc         sonokai-shusia-256-red-d)
       (sonokai-shusia-256-red-lc         sonokai-shusia-256-red-l)
       (sonokai-shusia-256-magenta-hc     sonokai-shusia-256-magenta-d)
       (sonokai-shusia-256-magenta-lc     sonokai-shusia-256-magenta-l)
       (sonokai-shusia-256-violet-hc      sonokai-shusia-256-violet-d)
       (sonokai-shusia-256-violet-lc      sonokai-shusia-256-violet-l)
       (sonokai-shusia-256-blue-hc        sonokai-shusia-256-blue-d)
       (sonokai-shusia-256-blue-lc        sonokai-shusia-256-blue-l)
       (sonokai-shusia-256-cyan-hc        sonokai-shusia-256-cyan-d)
       (sonokai-shusia-256-cyan-lc        sonokai-shusia-256-cyan-l)
       (sonokai-shusia-256-green-hc       sonokai-shusia-256-green-d)
       (sonokai-shusia-256-green-lc       sonokai-shusia-256-green-l)

       ;; Fringe
       (sonokai-shusia-256-fringe-bg sonokai-shusia-256-background))

  ;; Define faces
  (custom-theme-set-faces
   'sonokai-shusia

   ;; font lock for syntax highlighting
   `(font-lock-builtin-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight normal))))

   `(font-lock-comment-delimiter-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(font-lock-comment-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(font-lock-constant-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(font-lock-doc-face
     ((,sonokai-shusia-class (:foreground ,(if sonokai-shusia-doc-face-as-comment
                                               sonokai-shusia-comments
                                             sonokai-shusia-yellow)))
      (,sonokai-shusia-256-class (:foreground ,(if sonokai-shusia-doc-face-as-comment
                                                   sonokai-shusia-256-comments
                                                 sonokai-shusia-256-yellow)))))

   `(font-lock-function-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(font-lock-keyword-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight normal))))

   `(font-lock-negation-char-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(font-lock-preprocessor-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(font-lock-regexp-grouping-construct
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal))))

   `(font-lock-regexp-grouping-backslash
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :weight normal))))

   `(font-lock-string-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(font-lock-type-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :italic nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :italic nil))))

   `(font-lock-variable-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(font-lock-warning-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold
                                          :italic t
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :weight bold
                                              :italic t
                                              :underline t))))

   `(c-annotation-face
     ((,sonokai-shusia-class (:inherit font-lock-constant-face))
      (,sonokai-shusia-256-class (:inherit font-lock-constant-face))))

   ;; general coloring
   `(button ((t (:underline t))))

   `(tab-bar
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-foreground
                                              :background ,sonokai-shusia-256-background-d))))

   `(tab-bar-tab
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-background))))

   `(tab-bar-tab-inactive
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background-d))))

   `(tab-bar-tab-group-current
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-background))))

   `(tab-bar-tab-group-inactive
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background))))

   `(tab-bar-tab-ungrouped
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background))))

   `(default
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-background))))

   `(highlight
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight))))

   `(lazy-highlight
     ((,sonokai-shusia-class (:inherit highlight
                                       :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:inherit highlight
                                           :background ,sonokai-shusia-256-highlight-alt))))

   `(region
     ((,sonokai-shusia-class (:inherit highlight
                                       :background ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:inherit highlight
                                           :background ,sonokai-shusia-256-highlight))))

   `(secondary-selection
     ((,sonokai-shusia-class (:inherit region
                                       :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:inherit region
                                           :background ,sonokai-shusia-256-highlight-alt))))

   `(shadow
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(match
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green
                                          :foreground ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold))))

   `(cursor
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-red
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-red
                                              :inverse-video t))))

   `(mouse
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-foreground
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-foreground
                                              :inverse-video t))))

   `(escape-glyph
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(escape-glyph-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(fringe
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-fringe-bg))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-fringe-bg))))

   `(link
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline t
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline t
                                              :weight bold))))

   `(link-visited
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :underline t
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :underline t
                                              :weight normal))))

   `(success
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green ))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green ))))

   `(warning
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow ))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow ))))

   `(error
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(eval-sexp-fu-flash
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-green))))

   `(eval-sexp-fu-flash-error
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-red))))

   `(trailing-whitespace
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red))))

   `(vertical-border
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray))))

   `(menu
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-background))))

   `(minibuffer-prompt
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   ;; mode-line and powerline
   `(mode-line-buffer-id
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(mode-line
     ((,sonokai-shusia-class (:inverse-video unspecified
                                             :underline unspecified
                                             :foreground ,sonokai-shusia-emphasis
                                             :background ,sonokai-shusia-highlight
                                             :box (:line-width 1
                                                               :color ,sonokai-shusia-gray
                                                               :style unspecified)))
      (,sonokai-shusia-256-class (:inverse-video unspecified
                                                 :underline unspecified
                                                 :foreground ,sonokai-shusia-256-foreground
                                                 :background ,sonokai-shusia-256-background
                                                 :box (:line-width 1
                                                                   :color ,sonokai-shusia-256-highlight
                                                                   :style unspecified)))))

   `(powerline-active1
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray-d))))

   `(powerline-active2
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background))))


   `(mode-line-inactive
     ((,sonokai-shusia-class (:inverse-video unspecified
                                             :underline unspecified
                                             :foreground ,sonokai-shusia-comments
                                             :background ,sonokai-shusia-background
                                             :box (:line-width 1
                                                               :color ,sonokai-shusia-gray
                                                               :style unspecified)))
      (,sonokai-shusia-256-class (:inverse-video unspecified
                                                 :underline unspecified
                                                 :foreground ,sonokai-shusia-256-comments
                                                 :background ,sonokai-shusia-256-background
                                                 :box (:line-width 1
                                                                   :color ,sonokai-shusia-256-gray
                                                                   :style unspecified)))))

   `(powerline-inactive1
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray-d))))

   `(powerline-inactive2
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background))))

   ;; powerline-evil
   `(powerline-evil-base-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground)))
     (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground)))

   `(powerline-evil-emacs-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-violet)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-violet))))

   `(powerline-evil-normal-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-blue)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-blue))))

   `(powerline-evil-insert-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-green)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-green))))

   `(powerline-evil-motion-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-magenta)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-magenta))))

   `(powerline-evil-visual-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-orange)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-orange))))

   `(powerline-evil-replace-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-red)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-red))))

   `(powerline-evil-operator-face
     ((,sonokai-shusia-class (:inherit powerline-evil-base-face
                                       :foreground ,sonokai-shusia-cyan)))
     ((,sonokai-shusia-256-class (:inherit powerline-evil-base-face
                                           :foreground ,sonokai-shusia-256-cyan))))

   ;; telephone-line evil
   `(telephone-line-evil
     ((,sonokai-shusia-class (:inherit mode-line
                                       :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:inherit mode-line
                                           :foreground ,sonokai-shusia-256-foreground))))

   `(telephone-line-evil-emacs
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-violet))))

   `(telephone-line-evil-normal
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-blue))))

   `(telephone-line-evil-insert
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-green))))

   `(telephone-line-evil-replace
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-red))))

   `(telephone-line-evil-visual
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-orange))))

   `(telephone-line-evil-operator
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-cyan))))

   `(telephone-line-evil-motion
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-magenta))))

   `(telephone-line-evil-god
     ((,sonokai-shusia-class (:inherit telephone-line-evil
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-white-d))
      (,sonokai-shusia-256-class (:inherit telephone-line-evil
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-white-d))))

   ;; header-line
   `(header-line
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-highlight
                                          :box (:color ,sonokai-shusia-gray
                                                       :line-width 1
                                                       :style unspecified)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-highlight
                                              :box (:color ,sonokai-shusia-256-gray
                                                           :line-width 1
                                                           :style unspecified)))))

   ;; cua
   `(cua-global-mark
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-background))))

   `(cua-rectangle
     ((,sonokai-shusia-class (:inherit region))
      (,sonokai-shusia-256-class (:inherit region))))

   `(cua-rectangle-noselect
     ((,sonokai-shusia-class (:inherit secondary-selection))
      (,sonokai-shusia-256-class (:inherit secondary-selection))))

   ;; diary
   `(diary
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   ;; dired
   `(dired-directory
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(dired-flagged
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(dired-header
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-background
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background
                                              :inherit bold))))

   `(dired-ignored
     ((,sonokai-shusia-class (:inherit shadow))
      (,sonokai-shusia-256-class (:inherit shadow))))

   `(dired-mark
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(dired-marked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :inherit bold))))

   `(dired-perm-write
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :underline t))))

   `(dired-symlink
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :slant italic))))

   `(dired-warning
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :underline t))))

   ;; dropdown
   `(dropdown-list-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-blue))))

   `(dropdown-list-selection-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green
                                              :foreground ,sonokai-shusia-256-background))))

   ;; ecb
   `(ecb-default-highlight-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(ecb-history-bucket-node-dir-soure-path-face
     ((,sonokai-shusia-class (:inherit ecb-history-bucket-node-face
                                       :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:inherit ecb-history-bucket-node-face
                                           :foreground ,sonokai-shusia-256-yellow))))

   `(ecb-source-in-directories-buffer-face
     ((,sonokai-shusia-class (:inherit ecb-directories-general-face
                                       :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:inherit ecb-directories-general-face
                                           :foreground ,sonokai-shusia-256-foreground))))

   `(ecb-history-dead-buffer-face
     ((,sonokai-shusia-class (:inherit ecb-history-general-face
                                       :foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:inherit ecb-history-general-face
                                           :foreground ,sonokai-shusia-256-comments))))

   `(ecb-directory-not-accessible-face
     ((,sonokai-shusia-class (:inherit ecb-directories-general-face
                                       :foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:inherit ecb-directories-general-face
                                           :foreground ,sonokai-shusia-256-comments))))

   `(ecb-bucket-node-face
     ((,sonokai-shusia-class (:inherit ecb-default-general-face
                                       :weight normal
                                       :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:inherit ecb-default-general-face
                                           :weight normal
                                           :foreground ,sonokai-shusia-256-blue))))

   `(ecb-tag-header-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(ecb-analyse-bucket-element-face
     ((,sonokai-shusia-class (:inherit ecb-analyse-general-face
                                       :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit ecb-analyse-general-face
                                           :foreground ,sonokai-shusia-256-green))))

   `(ecb-directories-general-face
     ((,sonokai-shusia-class (:inherit ecb-default-general-face
                                       :height 1.0))
      (,sonokai-shusia-256-class (:inherit ecb-default-general-face
                                           :height 1.0))))

   `(ecb-method-non-semantic-face
     ((,sonokai-shusia-class (:inherit ecb-methods-general-face
                                       :foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:inherit ecb-methods-general-face
                                           :foreground ,sonokai-shusia-256-cyan))))

   `(ecb-mode-line-prefix-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(ecb-tree-guide-line-face
     ((,sonokai-shusia-class (:inherit ecb-default-general-face
                                       :foreground ,sonokai-shusia-gray
                                       :height 1.0))
      (,sonokai-shusia-256-class (:inherit ecb-default-general-face
                                           :foreground ,sonokai-shusia-256-gray
                                           :height 1.0))))

   ;; ee
   `(ee-bookmarked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis))))

   `(ee-category
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(ee-link
     ((,sonokai-shusia-class (:inherit link))
      (,sonokai-shusia-256-class (:inherit link))))

   `(ee-link-visited
     ((,sonokai-shusia-class (:inherit link-visited))
      (,sonokai-shusia-256-class (:inherit link-visited))))

   `(ee-marked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :weight bold))))

   `(ee-omitted
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(ee-shadow
     ((,sonokai-shusia-class (:inherit shadow))
      (,sonokai-shusia-256-class (:inherit shadow))))

   ;; grep
   `(grep-context-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(grep-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold
                                              :underline t))))

   `(grep-hit-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(grep-match-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   ;; isearch
   `(isearch
     ((,sonokai-shusia-class (:inherit region
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:inherit region
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-yellow))))

   `(isearch-fail
     ((,sonokai-shusia-class (:inherit isearch
                                       :foreground ,sonokai-shusia-red
                                       :background ,sonokai-shusia-background
                                       :bold t))
      (,sonokai-shusia-256-class (:inherit isearch
                                           :foreground ,sonokai-shusia-256-red
                                           :background ,sonokai-shusia-256-background
                                           :bold t))))


   ;; ace-jump-mode
   `(ace-jump-face-background
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background
                                          :inverse-video nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background
                                              :inverse-video nil))))

   `(ace-jump-face-foreground
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-background
                                          :inverse-video nil
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-background
                                              :inverse-video nil
                                              :weight bold))))

   ;; auctex
   `(font-latex-bold-face
     ((,sonokai-shusia-class (:inherit bold
                                       :foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:inherit bold
                                           :foreground ,sonokai-shusia-256-emphasis))))

   `(font-latex-doctex-documentation-face
     ((,sonokai-shusia-class (:background unspecified))
      (,sonokai-shusia-256-class (:background unspecified))))

   `(font-latex-doctex-preprocessor-face
     ((,sonokai-shusia-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))
      (,sonokai-shusia-256-class
       (:inherit (font-latex-doctex-documentation-face
                  font-lock-builtin-face
                  font-lock-preprocessor-face)))))

   `(font-latex-italic-face
     ((,sonokai-shusia-class (:inherit italic :foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:inherit italic :foreground ,sonokai-shusia-256-emphasis))))

   `(font-latex-math-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(font-latex-sectioning-0-face
     ((,sonokai-shusia-class (:inherit font-latex-sectioning-1-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit font-latex-sectioning-1-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(font-latex-sectioning-1-face
     ((,sonokai-shusia-class (:inherit font-latex-sectioning-2-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit font-latex-sectioning-2-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(font-latex-sectioning-2-face
     ((,sonokai-shusia-class (:inherit font-latex-sectioning-3-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit font-latex-sectioning-3-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(font-latex-sectioning-3-face
     ((,sonokai-shusia-class (:inherit font-latex-sectioning-4-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit font-latex-sectioning-4-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(font-latex-sectioning-4-face
     ((,sonokai-shusia-class (:inherit font-latex-sectioning-5-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit font-latex-sectioning-5-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(font-latex-sectioning-5-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-yellow
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch :
                                           foreground ,sonokai-shusia-256-yellow
                                           :weight bold))))

   `(font-latex-sedate-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis))))

   `(font-latex-slide-title-face
     ((,sonokai-shusia-class (:inherit (,sonokai-shusia-pitch font-lock-type-face)
                                       :weight bold
                                       :height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:inherit (,sonokai-shusia-pitch font-lock-type-face)
                                           :weight bold
                                           :height ,sonokai-shusia-height-plus-3))))

   `(font-latex-string-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(font-latex-subscript-face
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-minus-1))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-minus-1))))

   `(font-latex-superscript-face
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-minus-1))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-minus-1))))

   `(font-latex-verbatim-face
     ((,sonokai-shusia-class (:inherit fixed-pitch
                                       :foreground ,sonokai-shusia-foreground
                                       :slant italic))
      (,sonokai-shusia-256-class (:inherit fixed-pitch
                                           :foreground ,sonokai-shusia-256-foreground
                                           :slant italic))))

   `(font-latex-warning-face
     ((,sonokai-shusia-class (:inherit bold
                                       :foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:inherit bold
                                           :foreground ,sonokai-shusia-256-orange))))

   ;; auto-complete
   `(ac-candidate-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-blue))))

   `(ac-selection-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(ac-candidate-mouse-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(ac-completion-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :underline t))))

   `(ac-gtags-candidate-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-blue))))

   `(ac-gtags-selection-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(ac-yasnippet-candidate-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-yellow))))

   `(ac-yasnippet-selection-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-background))))

   ;; auto highlight symbol
   `(ahs-definition-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-blue))))

   `(ahs-edit-mode-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-highlight))))

   `(ahs-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :background unspecified))))

   `(ahs-plugin-bod-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-violet ))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-cyan ))))

   `(ahs-plugin-defalt-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-orange))))

   `(ahs-plugin-whole-buffer-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-green))))

   `(ahs-warning-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   ;; android mode
   `(android-mode-debug-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(android-mode-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :weight bold))))

   `(android-mode-info-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(android-mode-verbose-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(android-mode-warning-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   ;; anzu-mode
   `(anzu-mode-line
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :weight bold))))

   ;; bm
   `(bm-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-lc
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-lc
                                              :foreground ,sonokai-shusia-256-background))))

   `(bm-fringe-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-lc
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-lc
                                              :foreground ,sonokai-shusia-256-background))))

   `(bm-fringe-persistent-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-lc
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-lc
                                              :foreground ,sonokai-shusia-256-background))))

   `(bm-persistent-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-lc
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-lc
                                              :foreground ,sonokai-shusia-256-background))))

   ;; calfw
   `(cfw:face-day-title
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(cfw:face-annotation
     ((,sonokai-shusia-class (:inherit cfw:face-day-title
                                       :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:inherit cfw:face-day-title
                                           :foreground ,sonokai-shusia-256-yellow))))

   `(cfw:face-default-content
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(cfw:face-default-day
     ((,sonokai-shusia-class (:inherit cfw:face-day-title
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit cfw:face-day-title
                                           :weight bold))))

   `(cfw:face-disable
     ((,sonokai-shusia-class (:inherit cfw:face-day-title
                                       :foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:inherit cfw:face-day-title
                                           :foreground ,sonokai-shusia-256-comments))))

   `(cfw:face-grid
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(cfw:face-header
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-hc
                                          :background ,sonokai-shusia-blue-lc
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-hc
                                              :background ,sonokai-shusia-256-blue-lc
                                              :weight bold))))

   `(cfw:face-holiday
     ((,sonokai-shusia-class (:background nil
                                          :foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:background nil
                                              :foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   `(cfw:face-periods
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   `(cfw:face-select
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta-lc
                                          :foreground ,sonokai-shusia-magenta-hc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-magenta-lc
                                              :foreground ,sonokai-shusia-256-magenta-hc))))

   `(cfw:face-saturday
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan-hc
                                          :background ,sonokai-shusia-cyan-lc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan-hc
                                              :background ,sonokai-shusia-256-cyan-lc))))

   `(cfw:face-sunday
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-hc
                                          :background ,sonokai-shusia-red-lc
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-hc
                                              :background ,sonokai-shusia-256-red-lc
                                              :weight bold))))

   `(cfw:face-title
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-yellow
                                       :weight bold
                                       :height ,sonokai-shusia-height-plus-4))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-yellow
                                           :weight bold
                                           :height ,sonokai-shusia-height-plus-4))))

   `(cfw:face-today
     ((,sonokai-shusia-class (:weight bold
                                      :background ,sonokai-shusia-highlight-line
                                      :foreground nil))
      (,sonokai-shusia-256-class (:weight bold
                                          :background ,sonokai-shusia-256-highlight-line
                                          :foreground nil))))

   `(cfw:face-today-title
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-lc
                                          :foreground ,sonokai-shusia-yellow-hc
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-lc
                                              :foreground ,sonokai-shusia-256-yellow-hc
                                              :weight bold))))

   `(cfw:face-toolbar
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(cfw:face-toolbar-button-off
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-lc
                                          :foreground ,sonokai-shusia-yellow-hc
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-lc
                                              :foreground ,sonokai-shusia-256-yellow-hc
                                              :weight bold))))

   `(cfw:face-toolbar-button-on
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-hc
                                          :foreground ,sonokai-shusia-yellow-lc
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-hc
                                              :foreground ,sonokai-shusia-256-yellow-lc
                                              :weight bold))))

   ;; cider
   `(cider-enlightened
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background nil
                                          :box (:color ,sonokai-shusia-yellow :line-width -1 :style nil)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background nil
                                              :box (:color ,sonokai-shusia-256-yellow :line-width -1 :style nil))) ))

   `(cider-enlightened-local
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(cider-instrumented-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :background nil
                                          :box (:color ,sonokai-shusia-violet :line-width -1 :style nil)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :background nil
                                              :box (:color ,sonokai-shusia-256-violet :line-width -1 :style nil)))))

   `(cider-result-overlay-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background nil
                                          :box (:color ,sonokai-shusia-blue :line-width -1 :style nil)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background nil
                                              :box (:color ,sonokai-shusia-256-blue :line-width -1 :style nil)))))

   `(cider-test-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-orange))))

   `(cider-test-failure-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-red))))

   `(cider-test-success-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-green))))

   `(cider-traced-face
     ((,sonokai-shusia-class :box (:color ,sonokai-shusia-blue :line-width -1 :style nil))
      (,sonokai-shusia-256-class  :box (:color ,sonokai-shusia-256-blue :line-width -1 :style nil))))

   ;; clojure-test
   `(clojure-test-failure-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold
                                              :underline t))))

   `(clojure-test-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold
                                              :underline t))))

   `(clojure-test-success-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold
                                              :underline t))))

   ;; company-mode
   `(company-tooltip
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis))))

   `(company-tooltip-selection
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(company-tooltip-mouse
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(company-tooltip-common
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline t))))

   `(company-tooltip-common-selection
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-blue
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-blue
                                              :underline t))))

   `(company-preview
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis))))

   `(company-preview-common
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline t))))

   `(company-scrollbar-bg
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   `(company-scrollbar-fg
     ((,sonokai-shusia-class (:background ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-comments))))

   `(company-tooltip-annotation
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-green))))

   `(company-template-field
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-blue))))

   ;; compilation
   `(compilation-column-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :underline nil))))

   `(compilation-column-number
     ((,sonokai-shusia-class (:inherit font-lock-doc-face
                                       :foreground ,sonokai-shusia-cyan
                                       :underline nil))
      (,sonokai-shusia-256-class (:inherit font-lock-doc-face
                                           :foreground ,sonokai-shusia-256-cyan
                                           :underline nil))))

   `(compilation-enter-directory-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :underline nil))))

   `(compilation-error
     ((,sonokai-shusia-class (:inherit error
                                       :underline nil))
      (,sonokai-shusia-256-class (:inherit error
                                           :underline nil))))

   `(compilation-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :underline nil))))

   `(compilation-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :underline nil))))

   `(compilation-info
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :underline nil
                                          :bold nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :underline nil
                                              :bold nil))))

   `(compilation-info-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline nil))))

   `(compilation-leave-directory-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :underline nil))))

   `(compilation-line-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :underline nil))))

   `(compilation-line-number
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :underline nil))))

   `(compilation-warning
     ((,sonokai-shusia-class (:inherit warning
                                       :underline nil))
      (,sonokai-shusia-256-class (:inherit warning
                                           :underline nil))))

   `(compilation-warning-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal
                                              :underline nil))))

   `(compilation-mode-line-exit
     ((,sonokai-shusia-class (:inherit compilation-info
                                       :foreground ,sonokai-shusia-green
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit compilation-info
                                           :foreground ,sonokai-shusia-256-green
                                           :weight bold))))

   `(compilation-mode-line-fail
     ((,sonokai-shusia-class (:inherit compilation-error
                                       :foreground ,sonokai-shusia-red
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit compilation-error
                                           :foreground ,sonokai-shusia-256-red
                                           :weight bold))))

   `(compilation-mode-line-run
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :weight bold))))

   ;; CSCOPE
   `(cscope-file-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(cscope-function-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(cscope-line-number-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(cscope-line-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(cscope-mouse-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-foreground))))

   ;; ctable
   `(ctbl:face-cell-select
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :underline ,sonokai-shusia-emphasis
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :underline ,sonokai-shusia-256-emphasis
                                              :weight bold))))

   `(ctbl:face-continue-bar
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray
                                          :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray
                                              :foreground ,sonokai-shusia-256-yellow))))

   `(ctbl:face-row-select
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground
                                          :underline t))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground
                                              :underline t))))

   ;; coffee
   `(coffee-mode-class-name
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(coffee-mode-function-param
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :slant italic))))

   ;; custom
   `(custom-face-tag
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :height ,sonokai-shusia-height-plus-3
                                       :foreground ,sonokai-shusia-violet
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :height ,sonokai-shusia-height-plus-3
                                           :foreground ,sonokai-shusia-256-violet
                                           :weight bold))))

   `(custom-variable-tag
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-cyan
                                       :height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-cyan
                                           :height ,sonokai-shusia-height-plus-3))))

   `(custom-comment-tag
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(custom-group-tag
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-blue
                                       :height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-blue
                                           :height ,sonokai-shusia-height-plus-3))))

   `(custom-group-tag-1
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-red
                                       :height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-red
                                           :height ,sonokai-shusia-height-plus-3))))

   `(custom-state
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   ;; diff
   `(diff-added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background))))

   `(diff-changed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background))))

   `(diff-removed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background))))

   `(diff-header
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background))))

   `(diff-file-header
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground
                                              :weight bold))))

   `(diff-refine-added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-diff-green-base))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-diff-green-base))))

   `(diff-refine-change
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-diff-blue-base))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-diff-blue-base))))

   `(diff-refine-removed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-diff-red-base))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-diff-red-base))))

   ;; diff-hl
   `(diff-hl-change
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-hc-alt
                                          :foreground ,sonokai-shusia-yellow-hc-alt))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-hc
                                              :foreground ,sonokai-shusia-256-yellow-hc))))

   `(diff-hl-delete
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red-hc-alt
                                          :foreground ,sonokai-shusia-red-hc-alt))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red-hc
                                              :foreground ,sonokai-shusia-256-red-hc))))

   `(diff-hl-insert
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-hc-alt
                                          :foreground ,sonokai-shusia-green-hc-alt))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-hc
                                              :foreground ,sonokai-shusia-256-green-hc))))

   `(diff-hl-unknown
     ((,sonokai-shusia-class (:background ,sonokai-shusia-violet-hc
                                          :foreground ,sonokai-shusia-violet-hc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-violet-hc
                                              :foreground ,sonokai-shusia-256-violet-hc))))

   ;; ediff
   `(ediff-fine-diff-A
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-red-emphasis))
      (,sonokai-shusia-256-class (:foreground: ,sonokai-shusia-256-foreground
                                               :background ,sonokai-shusia-256-diff-red-emphasis))))

   `(ediff-fine-diff-B
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-green-base))
      (,sonokai-shusia-256-class (:foreground: sonokai-shusia-256-foreground,
                                               :background ,sonokai-shusia-256-diff-green-base))))

   `(ediff-fine-diff-C
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-blue-base))
      (,sonokai-shusia-256-class (:foreground: sonokai-shusia-foreground,
                                               :background ,sonokai-shusia-256-diff-blue-base))))

   `(ediff-current-diff-A
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-red-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-foreground
                                              :background ,sonokai-shusia-256-diff-red-alt))))

   `(ediff-current-diff-B
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-green-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-foreground
                                              :background ,sonokai-shusia-256-diff-green-alt))))

   `(ediff-current-diff-C
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-diff-blue-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-foreground
                                              :background ,sonokai-shusia-256-diff-blue-alt))))

   `(ediff-even-diff-A
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   `(ediff-odd-diff-A
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   `(ediff-even-diff-B
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   `(ediff-odd-diff-B
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   `(ediff-even-diff-C
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   `(ediff-odd-diff-C
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-alt
                                          :foreground ,sonokai-shusia-foreground ))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-alt
                                              :foreground ,sonokai-shusia-256-foreground ))))

   ;; edts
   `(edts-face-error-line
     ((,(append '((supports :underline (:style line))) sonokai-shusia-class)
       (:underline (:style line :color ,sonokai-shusia-red)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-red-hc
                                          :background ,sonokai-shusia-red-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style line))) sonokai-shusia-256-class )
       (:underline (:style line :color ,sonokai-shusia-256-red)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-hc
                                              :background ,sonokai-shusia-256-red-lc
                                              :weight bold
                                              :underline t))))

   `(edts-face-warning-line
     ((,(append '((supports :underline (:style line))) sonokai-shusia-class)
       (:underline (:style line :color ,sonokai-shusia-yellow)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-hc
                                          :background ,sonokai-shusia-yellow-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style line))) sonokai-shusia-256-class )
       (:underline (:style line :color ,sonokai-shusia-256-yellow)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow-hc
                                              :background ,sonokai-shusia-256-yellow-lc
                                              :weight bold
                                              :underline t))))

   `(edts-face-error-fringe-bitmap
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background unspecified
                                              :weight bold))))

   `(edts-face-warning-fringe-bitmap
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background unspecified
                                              :weight bold))))

   `(edts-face-error-mode-line
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red
                                          :foreground unspecified))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red
                                              :foreground unspecified))))

   `(edts-face-warning-mode-line
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground unspecified))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground unspecified))))


   ;; elfeed
   `(elfeed-search-date-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(elfeed-search-feed-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(elfeed-search-tag-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(elfeed-search-title-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   ;; elixir
   `(elixir-attribute-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(elixir-atom-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   ;; ein
   `(ein:cell-input-area
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))
   `(ein:cell-input-prompt
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))
   `(ein:cell-output-prompt
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))
   `(ein:notification-tab-normal
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))
   `(ein:notification-tab-selected
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange :inherit bold))))

   ;; enhanced ruby mode
   `(enh-ruby-string-delimiter-face
     ((,sonokai-shusia-class (:inherit font-lock-string-face))
      (,sonokai-shusia-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-heredoc-delimiter-face
     ((,sonokai-shusia-class (:inherit font-lock-string-face))
      (,sonokai-shusia-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-regexp-delimiter-face
     ((,sonokai-shusia-class (:inherit font-lock-string-face))
      (,sonokai-shusia-256-class (:inherit font-lock-string-face))))

   `(enh-ruby-op-face
     ((,sonokai-shusia-class (:inherit font-lock-keyword-face))
      (,sonokai-shusia-256-class (:inherit font-lock-keyword-face))))

   ;; erm-syn
   `(erm-syn-errline
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-red)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-red-hc
                                          :background ,sonokai-shusia-red-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-red)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-hc
                                              :background ,sonokai-shusia-256-red-lc
                                              :weight bold
                                              :underline t))))

   `(erm-syn-warnline
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-orange)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-orange-hc
                                          :background ,sonokai-shusia-orange-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-orange)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange-hc
                                              :background ,sonokai-shusia-256-orange-lc
                                              :weight bold
                                              :underline t))))

   ;; epc
   `(epc:face-title
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :underline nil))))

   ;; erc
   `(erc-action-face
     ((,sonokai-shusia-class (:inherit erc-default-face))
      (,sonokai-shusia-256-class (:inherit erc-default-face))))

   `(erc-bold-face
     ((,sonokai-shusia-class (:weight bold))
      (,sonokai-shusia-256-class (:weight bold))))

   `(erc-current-nick-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight bold))))

   `(erc-dangerous-host-face
     ((,sonokai-shusia-class (:inherit font-lock-warning-face))
      (,sonokai-shusia-256-class (:inherit font-lock-warning-face))))

   `(erc-default-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(erc-highlight-face
     ((,sonokai-shusia-class (:inherit erc-default-face
                                       :background ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:inherit erc-default-face
                                           :background ,sonokai-shusia-256-highlight))))

   `(erc-direct-msg-face
     ((,sonokai-shusia-class (:inherit erc-default-face))
      (,sonokai-shusia-256-class (:inherit erc-default-face))))

   `(erc-error-face
     ((,sonokai-shusia-class (:inherit font-lock-warning-face))
      (,sonokai-shusia-256-class (:inherit font-lock-warning-face))))

   `(erc-fool-face
     ((,sonokai-shusia-class (:inherit erc-default-face))
      (,sonokai-shusia-256-class (:inherit erc-default-face))))

   `(erc-input-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(erc-keyword-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight bold))))

   `(erc-nick-default-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(erc-my-nick-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   `(erc-nick-msg-face
     ((,sonokai-shusia-class (:inherit erc-default-face))
      (,sonokai-shusia-256-class (:inherit erc-default-face))))

   `(erc-notice-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(erc-pal-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :weight bold))))

   `(erc-prompt-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))

   `(erc-timestamp-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(erc-underline-face
     ((t (:underline t))))

   ;; eshell
   `(eshell-prompt
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :inherit bold))))

   `(eshell-ls-archive
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :inherit bold))))

   `(eshell-ls-backup
     ((,sonokai-shusia-class (:inherit font-lock-comment-face))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face))))

   `(eshell-ls-clutter
     ((,sonokai-shusia-class (:inherit font-lock-comment-face))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face))))

   `(eshell-ls-directory
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :inherit bold))))

   `(eshell-ls-executable
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :inherit bold))))

   `(eshell-ls-unreadable
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(eshell-ls-missing
     ((,sonokai-shusia-class (:inherit font-lock-warning-face))
      (,sonokai-shusia-256-class (:inherit font-lock-warning-face))))

   `(eshell-ls-product
     ((,sonokai-shusia-class (:inherit font-lock-doc-face))
      (,sonokai-shusia-256-class (:inherit font-lock-doc-face))))

   `(eshell-ls-special
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :inherit bold))))

   `(eshell-ls-symlink
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :inherit bold))))

   ;; evil-ex-substitute
   `(evil-ex-substitute-matches
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-red-l
                                          :inherit italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-red-l
                                              :inherit italic))))
   `(evil-ex-substitute-replacement
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-green-l
                                          :inherit italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line :foreground ,sonokai-shusia-256-green-l :inherit italic))))

   ;; evil-search-highlight-persist
   `(evil-search-highlight-persist-highlight-face
     ((,sonokai-shusia-class (:inherit region))
      (,sonokai-shusia-256-class (:inherit region))))

   ;; fic
   `(fic-author-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-orange
                                          :underline t
                                          :slant italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-orange
                                              :underline t
                                              :slant italic))))

   `(fic-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-orange
                                          :weight normal
                                          :slant italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-orange
                                              :weight normal
                                              :slant italic))))

   `(font-lock-fic-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-orange
                                          :weight normal
                                          :slant italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-orange
                                              :weight normal
                                              :slant italic))))

   ;; flx
   `(flx-highlight-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight normal
                                              :underline nil))))

   ;; flymake
   `(flymake-errline
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-red-hc
                                          :background ,sonokai-shusia-red-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-red)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-hc
                                              :background ,sonokai-shusia-256-red-lc
                                              :weight bold
                                              :underline t))))

   `(flymake-infoline
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-green-hc
                                          :background ,sonokai-shusia-green-lc))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-green)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-hc
                                              :background ,sonokai-shusia-256-green-lc))))

   `(flymake-warnline
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-hc
                                          :background ,sonokai-shusia-yellow-lc
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-yellow)
                   :inherit unspecified
                   :foreground unspecified
                   :background unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow-hc
                                              :background ,sonokai-shusia-256-yellow-lc
                                              :weight bold
                                              :underline t))))

   ;; flycheck
   `(flycheck-error
     ((,(append '((supports :underline (:style line))) sonokai-shusia-class)
       (:underline (:style line :color ,sonokai-shusia-red)))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style line))) sonokai-shusia-256-class )
       (:underline (:style line :color ,sonokai-shusia-256-red)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :weight bold
                                              :underline t))))

   `(flycheck-warning
     ((,(append '((supports :underline (:style line))) sonokai-shusia-class)
       (:underline (:style line :color ,sonokai-shusia-orange)))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :background ,sonokai-shusia-background
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style line))) sonokai-shusia-256-class )
       (:underline (:style line :color ,sonokai-shusia-256-orange)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :background ,sonokai-shusia-256-background
                                              :weight bold
                                              :underline t))))

   `(flycheck-info
     ((,(append '((supports :underline (:style line))) sonokai-shusia-class)
       (:underline (:style line :color ,sonokai-shusia-blue)))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-background
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style line))) sonokai-shusia-256-class )
       (:underline (:style line :color ,sonokai-shusia-256-blue)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background
                                              :weight bold
                                              :underline t))))

   `(flycheck-fringe-error
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-l
                                          :background unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-l
                                              :background unspecified
                                              :weight bold))))

   `(flycheck-fringe-warning
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange-l
                                          :background unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange-l
                                              :background unspecified
                                              :weight bold))))

   `(flycheck-fringe-info
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-l
                                          :background unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-l
                                              :background unspecified
                                              :weight bold))))

   ;; flyspell
   `(flyspell-duplicate
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-yellow)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-yellow)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold
                                              :underline t))))

   `(flyspell-incorrect
     ((,(append '((supports :underline (:style wave))) sonokai-shusia-class)
       (:underline (:style wave :color ,sonokai-shusia-red)
                   :inherit unspecified))
      (,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold
                                          :underline t))
      (,(append '((supports :underline (:style wave))) sonokai-shusia-256-class )
       (:underline (:style wave :color ,sonokai-shusia-256-red)
                   :inherit unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold
                                              :underline t))))


   ;; git-gutter
   `(git-gutter:added
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-green
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-green
                                           :weight bold))))

   `(git-gutter:deleted
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-red
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-red
                                           :weight bold))))

   `(git-gutter:modified
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-yellow
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-yellow
                                           :weight bold))))

   `(git-gutter:unchanged
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-highlight-line
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-highlight-line
                                           :weight bold))))

   ;; git-gutter-fr
   `(git-gutter-fr:added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :inherit bold))))

   `(git-gutter-fr:deleted
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :inherit bold))))

   `(git-gutter-fr:modified
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :inherit bold))))

   ;; git-gutter+ and git-gutter+-fr
   `(git-gutter+-added
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-green
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-green
                                           :weight bold))))

   `(git-gutter+-deleted
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-red
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-red
                                           :weight bold))))

   `(git-gutter+-modified
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-yellow
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-yellow
                                           :weight bold))))

   `(git-gutter+-unchanged
     ((,sonokai-shusia-class (:inherit default
                                       :background ,sonokai-shusia-background
                                       :foreground ,sonokai-shusia-highlight-line
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit default
                                           :background ,sonokai-shusia-256-background
                                           :foreground ,sonokai-shusia-256-highlight-line
                                           :weight bold))))

   `(git-gutter-fr+-added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(git-gutter-fr+-deleted
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   `(git-gutter-fr+-modified
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   ;; git-timemachine
   `(git-timemachine-minibuffer-detail-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-highlight-line
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-blue
                                              :background ,sonokai-shusia-256-highlight-line
                                              :inherit bold))))

   ;; guide-key
   `(guide-key/highlight-command-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(guide-key/key-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(guide-key/prefix-command-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   ;; gnus
   `(gnus-group-mail-1
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-mail-1-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-mail-1-empty))))

   `(gnus-group-mail-1-empty
     ((,sonokai-shusia-class (:inherit gnus-group-news-1-empty))
      (,sonokai-shusia-256-class (:inherit gnus-group-news-1-empty))))

   `(gnus-group-mail-2
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-mail-2-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-mail-2-empty))))

   `(gnus-group-mail-2-empty
     ((,sonokai-shusia-class (:inherit gnus-group-news-2-empty))
      (,sonokai-shusia-256-class (:inherit gnus-group-news-2-empty))))

   `(gnus-group-mail-3
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-mail-3-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-mail-3-empty))))

   `(gnus-group-mail-3-empty
     ((,sonokai-shusia-class (:inherit gnus-group-news-3-empty))
      (,sonokai-shusia-256-class (:inherit gnus-group-news-3-empty))))

   `(gnus-group-mail-low
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-mail-low-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-mail-low-empty))))

   `(gnus-group-mail-low-empty
     ((,sonokai-shusia-class (:inherit gnus-group-news-low-empty))
      (,sonokai-shusia-256-class (:inherit gnus-group-news-low-empty))))

   `(gnus-group-news-1
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-1-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-1-empty))))

   `(gnus-group-news-2
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-2-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-2-empty))))

   `(gnus-group-news-3
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-3-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-3-empty))))

   `(gnus-group-news-4
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-4-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-4-empty))))

   `(gnus-group-news-5
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-5-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-5-empty))))

   `(gnus-group-news-6
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-6-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-6-empty))))

   `(gnus-group-news-low
     ((,sonokai-shusia-class (:weight bold
                                      :inherit gnus-group-news-low-empty))
      (,sonokai-shusia-256-class (:weight bold
                                          :inherit gnus-group-news-low-empty))))

   `(gnus-header-content
     ((,sonokai-shusia-class (:inherit message-header-other))
      (,sonokai-shusia-256-class (:inherit message-header-other))))

   `(gnus-header-from
     ((,sonokai-shusia-class (:inherit message-header-other))
      (,sonokai-shusia-256-class (:inherit message-header-other))))

   `(gnus-header-name
     ((,sonokai-shusia-class (:inherit message-header-name))
      (,sonokai-shusia-256-class (:inherit message-header-name))))

   `(gnus-header-newsgroups
     ((,sonokai-shusia-class (:inherit message-header-other))
      (,sonokai-shusia-256-class (:inherit message-header-other))))

   `(gnus-header-subject
     ((,sonokai-shusia-class (:inherit message-header-subject))
      (,sonokai-shusia-256-class (:inherit message-header-subject))))

   `(gnus-summary-cancelled
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(gnus-summary-high-ancient
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight bold))))

   `(gnus-summary-high-read
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(gnus-summary-high-ticked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :weight bold))))

   `(gnus-summary-high-unread
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight bold))))

   `(gnus-summary-low-ancient
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-summary-low-read
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-summary-low-ticked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(gnus-summary-low-unread
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(gnus-summary-normal-ancient
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-summary-normal-read
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-summary-normal-ticked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(gnus-summary-normal-unread
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(gnus-summary-selected
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(gnus-cite-1
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-cite-2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-cite-3
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-cite-4
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-cite-5
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-cite-6
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-cite-7
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(gnus-cite-8
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(gnus-cite-9
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(gnus-cite-10
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(gnus-cite-11
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(gnus-group-news-1-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(gnus-group-news-2-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-group-news-3-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(gnus-group-news-4-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-group-news-5-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(gnus-group-news-6-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-lc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-lc))))

   `(gnus-group-news-low-empty
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(gnus-signature
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(gnus-x-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-foreground
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-foreground
                                              :foreground ,sonokai-shusia-256-background))))


   ;; helm
   `(helm-apt-deinstalled
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(helm-apt-installed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-bookmark-directory
     ((,sonokai-shusia-class (:inherit helm-ff-directory))
      (,sonokai-shusia-256-class (:inherit helm-ff-directory))))

   `(helm-bookmark-file
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(helm-bookmark-gnus
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(helm-bookmark-info
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-bookmark-man
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(helm-bookmark-w3m
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(helm-bookmarks-su
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(helm-buffer-file
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(helm-buffer-directory
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(helm-buffer-process
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(helm-buffer-saved-out
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :inverse-video t))))

   `(helm-buffer-size
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(helm-candidate-number
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :bold t))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :bold t))))

   `(helm-ff-directory
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(helm-ff-executable
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-ff-file
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(helm-ff-invalid-symlink
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-orange
                                          :slant italic))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-orange
                                              :slant italic))))

   `(helm-ff-prefix
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green
                                              :foreground ,sonokai-shusia-256-background))))

   `(helm-ff-symlink
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(helm-grep-file
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :underline t))))

   `(helm-grep-finish
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-grep-lineno
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(helm-grep-match
     ((,sonokai-shusia-class (:inherit helm-match))
      (,sonokai-shusia-256-class (:inherit helm-match))))

   `(helm-grep-running
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(helm-header
     ((,sonokai-shusia-class (:inherit header-line))
      (,sonokai-shusia-256-class (:inherit terminal-header-line))))

   `(helm-lisp-completion-info
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(helm-lisp-show-completion
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-highlight-line
                                          :bold t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-highlight-line
                                              :bold t))))

   `(helm-M-x-key
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :underline t))))

   `(helm-moccur-buffer
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :underline t))))

   `(helm-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green :inherit bold))))

   `(helm-match-item
     ((,sonokai-shusia-class (:inherit helm-match))
      (,sonokai-shusia-256-class (:inherit helm-match))))

   `(helm-selection
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight
                                          :inherit bold
                                          :underline nil))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight
                                              :inherit bold
                                              :underline nil))))

   `(helm-selection-line
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :underline nil))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :underline nil))))

   `(helm-separator
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray))))

   `(helm-source-header
     ((,sonokai-shusia-class (:background ,sonokai-shusia-violet-l
                                          :foreground ,sonokai-shusia-background
                                          :underline nil))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-violet-l
                                              :foreground ,sonokai-shusia-256-background
                                              :underline nil))))

   `(helm-swoop-target-line-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(helm-swoop-target-line-block-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(helm-swoop-target-word-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-time-zone-current
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(helm-time-zone-home
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(helm-visible-mark
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-magenta :bold t))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-magenta :bold t))))

   ;; helm-ls-git
   `(helm-ls-git-modified-not-staged-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-blue)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-blue)))

   `(helm-ls-git-modified-and-staged-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-blue-l)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-blue-l)))

   `(helm-ls-git-renamed-modified-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-blue-l)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-blue-l)))

   `(helm-ls-git-untracked-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-orange)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-orange)))

   `(helm-ls-git-added-copied-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-green)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-green)))

   `(helm-ls-git-added-modified-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-green-l)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-green-l)))

   `(helm-ls-git-deleted-not-staged-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-red)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-red)))

   `(helm-ls-git-deleted-and-staged-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-red-l)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-red-l)))

   `(helm-ls-git-conflict-face
     ((,sonokai-shusia-class :foreground ,sonokai-shusia-yellow)
      (,sonokai-shusia-256-class  :foreground ,sonokai-shusia-256-yellow)))

   ;; hi-lock-mode
   `(hi-yellow
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-lc
                                          :background ,sonokai-shusia-yellow-hc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow-lc
                                              :background ,sonokai-shusia-256-yellow-hc))))

   `(hi-pink
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta-lc
                                          :background ,sonokai-shusia-magenta-hc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta-lc
                                              :background ,sonokai-shusia-256-magenta-hc))))

   `(hi-green
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green-lc
                                          :background ,sonokai-shusia-green-hc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-lc
                                              :background ,sonokai-shusia-256-green-hc))))

   `(hi-blue
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-lc
                                          :background ,sonokai-shusia-blue-hc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-lc
                                              :background ,sonokai-shusia-256-blue-hc))))

   `(hi-black-b
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))

   `(hi-blue-b
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-lc
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-lc
                                              :weight bold))))

   `(hi-green-b
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green-lc
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-lc
                                              :weight bold))))

   `(hi-red-b
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   `(hi-black-hb
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))

   ;; highlight-changes
   `(highlight-changes
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(highlight-changes-delete
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :underline t))))

   ;; highlight-indentation
   `(highlight-indentation-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   `(highlight-indentation-current-column-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   ;; highlight-symbol
   `(highlight-symbol-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight))))

   ;; hl-line-mode
   `(hl-line
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(hl-line-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   ;; ido-mode
   `(ido-first-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal))))

   `(ido-only-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-yellow
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-yellow
                                              :weight normal))))

   `(ido-subdir
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(ido-incomplete-regexp
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold ))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold ))))

   `(ido-indicator
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red
                                          :foreground ,sonokai-shusia-background
                                          :width condensed))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red
                                              :foreground ,sonokai-shusia-256-background
                                              :width condensed))))

   `(ido-virtual
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   ;; info
   `(info-header-xref
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :inherit bold
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :inherit bold
                                              :underline t))))

   `(info-menu
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(info-node
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :inherit bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :inherit bold))))

   `(info-quoted-name
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(info-reference-item
     ((,sonokai-shusia-class (:background nil
                                          :underline t
                                          :inherit bold))
      (,sonokai-shusia-256-class (:background nil
                                              :underline t
                                              :inherit bold))))

   `(info-string
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(info-title-1
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-plus-4))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-plus-4))))

   `(info-title-2
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-plus-3))))

   `(info-title-3
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-plus-2))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-plus-2))))

   `(info-title-4
     ((,sonokai-shusia-class (:height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:height ,sonokai-shusia-height-plus-1))))

   ;; ivy
   `(ivy-current-match
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray :inherit bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-gray-l :inherit bold))))

   `(ivy-minibuffer-match-face-1
     ((,sonokai-shusia-class (:inherit bold))
      (,sonokai-shusia-256-class (:inherit bold))))

   `(ivy-minibuffer-match-face-2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :underline t))))

   `(ivy-minibuffer-match-face-3
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :underline t))))

   `(ivy-minibuffer-match-face-4
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :underline t))))

   `(ivy-remote
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(swiper-line-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))))

   `(swiper-match-face-1
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray-d))))

   `(swiper-match-face-2
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green))))

   `(swiper-match-face-3
     ((,sonokai-shusia-class (:background ,sonokai-shusia-orange))))

   `(swiper-match-face-4
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta))))

   ;; jabber
   `(jabber-activity-face
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-red))))

   `(jabber-activity-personal-face
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-blue))))

   `(jabber-chat-error
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-red))))

   `(jabber-chat-prompt-foreign
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-red))))

   `(jabber-chat-prompt-local
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-blue))))

   `(jabber-chat-prompt-system
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-green))))

   `(jabber-chat-text-foreign
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(jabber-chat-text-local
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(jabber-chat-rare-time-face
     ((,sonokai-shusia-class (:underline t
                                         :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:underline t
                                             :foreground ,sonokai-shusia-256-green))))

   `(jabber-roster-user-away
     ((,sonokai-shusia-class (:slant italic
                                     :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:slant italic
                                         :foreground ,sonokai-shusia-256-green))))

   `(jabber-roster-user-chatty
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-orange))))

   `(jabber-roster-user-dnd
     ((,sonokai-shusia-class (:slant italic
                                     :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:slant italic
                                         :foreground ,sonokai-shusia-256-red))))

   `(jabber-roster-user-error
     ((,sonokai-shusia-class (:weight light
                                      :slant italic
                                      :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:weight light
                                          :slant italic
                                          :foreground ,sonokai-shusia-256-red))))

   `(jabber-roster-user-offline
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(jabber-roster-user-online
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-blue))))

   `(jabber-roster-user-xa
     ((,sonokai-shusia-class (:slant italic
                                     :foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:slant italic
                                         :foreground ,sonokai-shusia-256-magenta))))

   ;; js2-mode colors
   `(js2-error
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(js2-external-variable
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(js2-function-call
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(js2-function-param
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(js2-instance-member
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(js2-jsdoc-html-tag-delimiter
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(js2-jsdoc-html-tag-name
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(js2-jsdoc-tag
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(js2-jsdoc-type
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(js2-jsdoc-value
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(js2-magic-paren
     ((,sonokai-shusia-class (:underline t))
      (,sonokai-shusia-256-class (:underline t))))

   `(js2-object-property
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(js2-private-function-call
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(js2-private-member
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(js2-warning
     ((,sonokai-shusia-class (:underline ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:underline ,sonokai-shusia-256-orange))))

   ;; jedi
   `(jedi:highlight-function-argument
     ((,sonokai-shusia-class (:inherit bold))
      (,sonokai-shusia-256-class (:inherit bold))))

   ;; linum-mode
   `(linum
     ((,sonokai-shusia-class (:inherit default
                                       :foreground ,sonokai-shusia-line-number
                                       :background ,sonokai-shusia-fringe-bg
                                       :underline nil))
      (,sonokai-shusia-256-class (:inherit default
                                           :foreground ,sonokai-shusia-256-line-number
                                           :background ,sonokai-shusia-256-fringe-bg
                                           :underline nil))))

   ;; line-number (>= Emacs26)
   `(line-number ((t (:inherit default
                               :foreground ,sonokai-shusia-line-number
                               :background ,sonokai-shusia-fringe-bg
                               :underline nil))))
   `(line-number-current-line ((t (:inherit line-number
                                            :foreground ,sonokai-shusia-orange
                                            :background ,sonokai-shusia-highlight
                                            :underline nil))))

   ;; linum-relative-current-face
   `(linum-relative-current-face
     ((,sonokai-shusia-class (:inherit default
                                       :foreground ,sonokai-shusia-orange
                                       :background ,sonokai-shusia-fringe-bg
                                       :underline nil))
      (,sonokai-shusia-256-class (:inherit default
                                           :foreground ,sonokai-shusia-256-orange
                                           :background ,sonokai-shusia-256-fringe-bg
                                           :underline nil))))

   ;; lsp-mode
   `(lsp-ui-doc-header
     ((,sonokai-shusia-class (:inherit org-document-title))
      (,sonokai-shusia-256-class (:inherit org-document-title))))

   `(lsp-ui-doc-background
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-highlight-line))))

   ;; lusty-explorer
   `(lusty-directory-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-directory))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-directory))))

   `(lusty-file-face
     ((,sonokai-shusia-class nil)
      (,sonokai-shusia-256-class  nil)))

   `(lusty-match-face
     ((,sonokai-shusia-class (:inherit ido-first-match))
      (,sonokai-shusia-256-class (:inherit ido-first-match))))

   `(lusty-slash-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :weight bold))))

   ;; magit
   `(magit-bisect-good
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-bisect-skip
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(magit-bisect-bad
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(magit-blame-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-highlight-alt))))

   `(magit-diff-file-heading-selection
     ((,sonokai-shusia-class (:inherit magit-diff-file-heading-highlight
                                       :foreground ,sonokai-shusia-orange-d))
      (,sonokai-shusia-256-class (:inherit magit-diff-file-heading-highlight
                                           :foreground ,sonokai-shusia-256-orange-d))))

   `(magit-diff-hunk-heading
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-d
                                          :background ,sonokai-shusia-gray-l))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-d
                                              :background ,sonokai-shusia-256-gray-l))))

   `(magit-diff-hunk-heading-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background
                                          :background ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background
                                              :background ,sonokai-shusia-256-foreground))))

   `(magit-diff-hunk-heading-selection
     ((,sonokai-shusia-class (:inherit magit-diff-hunk-heading-highlight
                                       :foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:inherit magit-diff-hunk-heading-highlight
                                           :foreground ,sonokai-shusia-256-orange))))

   `(magit-diff-lines-heading
     ((,sonokai-shusia-class (:inherit magit-diff-hunk-heading-highlight
                                       :foreground ,sonokai-shusia-background
                                       :background ,sonokai-shusia-orange-l))
      (,sonokai-shusia-256-class (:inherit magit-diff-hunk-heading-highlight
                                           :foreground ,sonokai-shusia-256-background
                                           :background ,sonokai-shusia-256-orange-l))))

   `(magit-diff-added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background))))

   `(magit-diff-removed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background))))

   `(magit-diff-base
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-background))))

   `(magit-diff-context
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-l))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-l))))

   `(magit-diff-added-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-highlight-alt))))

   `(magit-diff-removed-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-highlight-alt))))

   `(magit-diff-base-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-highlight-alt))))

   `(magit-diff-context-highlight
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-highlight-alt))))

   `(magit-diffstat-added
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-diffstat-removed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(magit-log-graph
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(magit-log-author
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-d
                                          :slant normal
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-d
                                              :slant normal
                                              :weight normal))))

   `(magit-log-date
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray
                                          :slant normal
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray
                                              :slant normal
                                              :weight normal))))

   `(magit-process-ok
     ((,sonokai-shusia-class (:inherit magit-section-heading
                                       :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit magit-section-heading
                                           :foreground ,sonokai-shusia-256-green))))

   `(magit-process-ng
     ((,sonokai-shusia-class (:inherit magit-section-heading
                                       :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:inherit magit-section-heading
                                           :foreground ,sonokai-shusia-256-red))))

   `(magit-reflog-commit
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-reflog-amend
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   `(magit-reflog-merge
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-reflog-checkout
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(magit-reflog-reset
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(magit-reflog-rebase
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(magit-reflog-cherry-pick
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-reflog-remote
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(magit-reflog-other
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(magit-section-highlight
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(magit-section-heading
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(magit-section-heading-selection
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(magit-sequence-stop
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(magit-sequence-part
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(magit-sequence-head
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(magit-sequence-drop
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(magit-dimmed
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(magit-hash
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(magit-tag
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(magit-branch-remote
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(magit-branch-local
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(magit-refname
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(magit-signature-good
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-d))))

   `(magit-signature-bad
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-d
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-d
                                              :weight bold))))

   `(magit-signature-untrusted
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(magit-signature-expired
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(magit-signature-revoked
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   `(magit-signature-error
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-l))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-l))))

   `(magit-cherry-unmatched
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(magit-cherry-equivalent
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   ;; man
   `(Man-overstrike
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight bold))))

   `(Man-reverse
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(Man-underline
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green :underline t))))

   ;; monky
   `(monky-section-title
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(monky-diff-add
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(monky-diff-del
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; markdown-mode
   `(markdown-header-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(markdown-header-face-1
     ((,sonokai-shusia-class (:inherit markdown-header-face
                                       :height ,sonokai-shusia-height-plus-4))
      (,sonokai-shusia-256-class (:inherit markdown-header-face
                                           :height ,sonokai-shusia-height-plus-4))))

   `(markdown-header-face-2
     ((,sonokai-shusia-class (:inherit markdown-header-face
                                       :height ,sonokai-shusia-height-plus-3))
      (,sonokai-shusia-256-class (:inherit markdown-header-face
                                           :height ,sonokai-shusia-height-plus-3))))

   `(markdown-header-face-3
     ((,sonokai-shusia-class (:inherit markdown-header-face
                                       :height ,sonokai-shusia-height-plus-2))
      (,sonokai-shusia-256-class (:inherit markdown-header-face
                                           :height ,sonokai-shusia-height-plus-2))))

   `(markdown-header-face-4
     ((,sonokai-shusia-class (:inherit markdown-header-face
                                       :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:inherit markdown-header-face
                                           :height ,sonokai-shusia-height-plus-1))))

   `(markdown-header-face-5
     ((,sonokai-shusia-class (:inherit markdown-header-face))
      (,sonokai-shusia-256-class (:inherit markdown-header-face))))

   `(markdown-header-face-6
     ((,sonokai-shusia-class (:inherit markdown-header-face))
      (,sonokai-shusia-256-class (:inherit markdown-header-face))))

   ;; message-mode
   `(message-cited-text
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(message-header-name
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(message-header-other
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight normal))))

   `(message-header-to
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight normal))))

   `(message-header-cc
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight normal))))

   `(message-header-newsgroups
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(message-header-subject
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :weight normal))))

   `(message-header-xheader
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(message-mml
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(message-separator
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :slant italic))))

   ;; mew
   `(mew-face-header-subject
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(mew-face-header-from
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(mew-face-header-date
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-header-to
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-header-key
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-header-private
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-header-important
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(mew-face-header-marginal
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight bold))))

   `(mew-face-header-warning
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-header-xmew
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-header-xmew-bad
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-body-url
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(mew-face-body-comment
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :slant italic))))

   `(mew-face-body-cite1
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-body-cite2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(mew-face-body-cite3
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(mew-face-body-cite4
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(mew-face-body-cite5
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-mark-review
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(mew-face-mark-escape
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-mark-delete
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-mark-unlink
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(mew-face-mark-refile
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-mark-unread
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(mew-face-eof-message
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(mew-face-eof-part
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   ;; mingus
   `(mingus-directory-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(mingus-pausing-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   `(mingus-playing-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(mingus-playlist-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan ))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan ))))

   `(mingus-song-file-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(mingus-stopped-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; mmm
   `(mmm-init-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-violet-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-violet-d))))

   `(mmm-cleanup-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-orange-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-orange-d))))

   `(mmm-declaration-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-cyan-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-cyan-d))))

   `(mmm-comment-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue-d))))

   `(mmm-output-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red-d))))

   `(mmm-special-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-d))))

   `(mmm-code-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   `(mmm-default-submode-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray-d))))

   ;; moccur
   `(moccur-current-line-face
     ((,sonokai-shusia-class (:underline t))
      (,sonokai-shusia-256-class (:underline t))))

   `(moccur-edit-done-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background
                                              :slant italic))))

   `(moccur-edit-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-background))))

   `(moccur-edit-file-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(moccur-edit-reject-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(moccur-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :weight bold))))

   `(search-buffers-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :weight bold))))

   `(search-buffers-header-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   ;; mu4e
   `(mu4e-cited-1-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-2-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-3-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-4-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-5-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-6-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :slant italic
                                              :weight normal))))

   `(mu4e-cited-7-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :slant italic
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :slant italic
                                              :weight normal))))

   `(mu4e-flagged-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :weight bold))))

   `(mu4e-view-url-number-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal))))

   `(mu4e-warning-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :slant normal
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :slant normal
                                              :weight bold))))

   `(mu4e-header-highlight-face
     ((,sonokai-shusia-class (:inherit unspecified
                                       :foreground unspecified
                                       :background ,sonokai-shusia-highlight-line
                                       :underline ,sonokai-shusia-emphasis
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit unspecified
                                           :foreground unspecified
                                           :background ,sonokai-shusia-256-highlight-line
                                           :underline ,sonokai-shusia-256-emphasis
                                           :weight normal))))


   `(mu4e-draft-face
     ((,sonokai-shusia-class (:inherit font-lock-string-face))
      (,sonokai-shusia-256-class (:inherit font-lock-string-face))))

   `(mu4e-footer-face
     ((,sonokai-shusia-class (:inherit font-lock-comment-face))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face))))

   `(mu4e-forwarded-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face
                                           :weight normal))))

   `(mu4e-header-face
     ((,sonokai-shusia-class (:inherit default))
      (,sonokai-shusia-256-class (:inherit default))))

   `(mu4e-header-marks-face
     ((,sonokai-shusia-class (:inherit font-lock-preprocessor-face))
      (,sonokai-shusia-256-class (:inherit font-lock-preprocessor-face))))

   `(mu4e-header-title-face
     ((,sonokai-shusia-class (:inherit font-lock-type-face))
      (,sonokai-shusia-256-class (:inherit font-lock-type-face))))

   `(mu4e-highlight-face
     ((,sonokai-shusia-class (:inherit font-lock-pseudo-keyword-face
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit font-lock-pseudo-keyword-face
                                           :weight bold))))

   `(mu4e-moved-face
     ((,sonokai-shusia-class (:inherit font-lock-comment-face
                                       :slant italic))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face
                                           :slant italic))))

   `(mu4e-ok-face
     ((,sonokai-shusia-class (:inherit font-lock-comment-face
                                       :slant normal
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face
                                           :slant normal
                                           :weight bold))))

   `(mu4e-replied-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face
                                           :weight normal))))

   `(mu4e-system-face
     ((,sonokai-shusia-class (:inherit font-lock-comment-face
                                       :slant italic))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face
                                           :slant italic))))

   `(mu4e-title-face
     ((,sonokai-shusia-class (:inherit font-lock-type-face
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit font-lock-type-face
                                           :weight bold))))

   `(mu4e-trashed-face
     ((,sonokai-shusia-class (:inherit font-lock-comment-face
                                       :strike-through t))
      (,sonokai-shusia-256-class (:inherit font-lock-comment-face
                                           :strike-through t))))

   `(mu4e-unread-face
     ((,sonokai-shusia-class (:inherit font-lock-keyword-face
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit font-lock-keyword-face
                                           :weight bold))))

   `(mu4e-view-attach-number-face
     ((,sonokai-shusia-class (:inherit font-lock-variable-name-face
                                       :weight bold))
      (,sonokai-shusia-256-class (:inherit font-lock-variable-name-face
                                           :weight bold))))

   `(mu4e-view-contact-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :weight normal))))

   `(mu4e-view-header-key-face
     ((,sonokai-shusia-class (:inherit message-header-name
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit message-header-name
                                           :weight normal))))

   `(mu4e-view-header-value-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :weight normal
                                          :slant normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :weight normal
                                              :slant normal))))

   `(mu4e-view-link-face
     ((,sonokai-shusia-class (:inherit link))
      (,sonokai-shusia-256-class (:inherit link))))

   `(mu4e-view-special-header-value-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight normal
                                              :underline nil))))

   ;; mumamo
   `(mumamo-background-chunk-submode1
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   ;; nav
   `(nav-face-heading
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(nav-face-button-num
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(nav-face-dir
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(nav-face-hdir
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(nav-face-file
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(nav-face-hfile
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; nav-flash
   `(nav-flash-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   ;; neo-tree
   `(neo-banner-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))


   `(neo-header-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background))))

   `(neo-root-dir-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background))))

   `(neo-dir-link-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-background))))

   `(neo-file-link-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(neo-button-face
     ((,sonokai-shusia-class (:underline nil))
      (,sonokai-shusia-256-class (:underline nil))))

   `(neo-expand-btn-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(neo-vc-default-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(neo-vc-user-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :slant italic))))

   `(neo-vc-up-to-date-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(neo-vc-edited-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(neo-vc-needs-update-face
     ((,sonokai-shusia-class (:underline t))
      (,sonokai-shusia-256-class (:underline t))))

   `(neo-vc-needs-merge-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(neo-vc-unlocked-changes-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-comments))))

   `(neo-vc-added-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(neo-vc-removed-face
     ((,sonokai-shusia-class (:strike-through t))
      (,sonokai-shusia-256-class (:strike-through t))))

   `(neo-vc-conflict-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(neo-vc-missing-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(neo-vc-ignored-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   ;; adoc-mode / markup
   `(markup-meta-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-l))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-l))))

   `(markup-table-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue-hc
                                          :background ,sonokai-shusia-blue-lc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue-hc
                                              :background ,sonokai-shusia-256-blue-lc))))

   `(markup-verbatim-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-orange-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-orange-lc))))

   `(markup-list-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet-hc
                                          :background ,sonokai-shusia-violet-lc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet-hc
                                              :background ,sonokai-shusia-256-violet-lc))))

   `(markup-replacement-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(markup-complex-replacement-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet-hc
                                          :background ,sonokai-shusia-violet-lc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet-hc
                                              :background ,sonokai-shusia-256-violet-lc))))

   `(markup-gen-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(markup-secondary-text-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; org-mode
   `(org-agenda-structure
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-highlight-line
                                          :weight bold
                                          :slant normal
                                          :inverse-video nil
                                          :height ,sonokai-shusia-height-plus-1
                                          :underline nil
                                          :box (:line-width 2 :color ,sonokai-shusia-background)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-highlight-line
                                              :weight bold
                                              :slant normal
                                              :inverse-video nil
                                              :height ,sonokai-shusia-height-plus-1
                                              :underline nil
                                              :box (:line-width 2 :color ,sonokai-shusia-256-background)))))

   `(org-agenda-calendar-event
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis))))

   `(org-agenda-calendar-sexp
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :slant italic))))

   `(org-agenda-date
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video nil
                                          :overline nil
                                          :slant normal
                                          :height 1.0
                                          :box (:line-width 2 :color ,sonokai-shusia-background)))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video nil
                                              :overline nil
                                              :slant normal
                                              :height 1.0
                                              :box (:line-width 2 :color ,sonokai-shusia-256-background)))) t)

   `(org-agenda-date-weekend
     ((,sonokai-shusia-class (:inherit org-agenda-date
                                       :inverse-video nil
                                       :background unspecified
                                       :foreground ,sonokai-shusia-comments
                                       :weight unspecified
                                       :underline t
                                       :overline nil
                                       :box unspecified))
      (,sonokai-shusia-256-class (:inherit org-agenda-date
                                           :inverse-video nil
                                           :background unspecified
                                           :foreground ,sonokai-shusia-256-comments
                                           :weight unspecified
                                           :underline t
                                           :overline nil
                                           :box unspecified))) t)

   `(org-agenda-date-today
     ((,sonokai-shusia-class (:inherit org-agenda-date
                                       :inverse-video t
                                       :weight bold
                                       :underline unspecified
                                       :overline nil
                                       :box unspecified
                                       :foreground ,sonokai-shusia-blue
                                       :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:inherit org-agenda-date
                                           :inverse-video t
                                           :weight bold
                                           :underline unspecified
                                           :overline nil
                                           :box unspecified
                                           :foreground ,sonokai-shusia-256-blue
                                           :background ,sonokai-shusia-256-background))) t)

   `(org-agenda-done
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :slant italic))) t)

   `(org-archived
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :weight normal))))

   `(org-block
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background-d))))

   `(org-block-background
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-d))))

   `(org-block-begin-line
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-l
                                          :weight bold
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-l
                                              :weight bold
                                              :slant italic))))

   `(org-block-end-line
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-l
                                          :weight bold
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-l
                                              :weight bold
                                              :slant italic))))

   `(org-checkbox
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground
                                          :box nil))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground
                                              :box nil))))

   `(org-code
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background-d))))

   `(org-date
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline t))))

   `(org-done
     ((,sonokai-shusia-class (:weight bold
                                      :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:weight bold
                                          :foreground ,sonokai-shusia-256-green))))

   `(org-ellipsis
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(org-formula
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(org-headline-done
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(org-hide
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-background))))

   `(org-level-1
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :height ,sonokai-shusia-height-plus-4
                                       :foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :height ,sonokai-shusia-height-plus-4
                                           :foreground ,sonokai-shusia-256-orange))))

   `(org-level-2
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :height ,sonokai-shusia-height-plus-3
                                       :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :height ,sonokai-shusia-height-plus-3
                                           :foreground ,sonokai-shusia-256-green))))

   `(org-level-3
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :height ,sonokai-shusia-height-plus-2
                                       :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :height ,sonokai-shusia-height-plus-2
                                           :foreground ,sonokai-shusia-256-blue))))

   `(org-level-4
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :height ,sonokai-shusia-height-plus-1
                                       :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :height ,sonokai-shusia-height-plus-1
                                           :foreground ,sonokai-shusia-256-yellow))))

   `(org-level-5
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-cyan))))

   `(org-level-6
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-green))))

   `(org-level-7
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-red))))

   `(org-level-8
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-blue))))

   `(org-link
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :underline t))))

   `(org-sexp-date
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(org-scheduled
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(org-scheduled-previously
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(org-scheduled-today
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :weight normal))))

   `(org-special-keyword
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :weight bold))))

   `(org-table
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-white-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-white-d))))

   `(org-tag
     ((,sonokai-shusia-class (:weight bold))
      (,sonokai-shusia-256-class (:weight bold))))

   `(org-time-grid
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(org-todo
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-d
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-d
                                              :weight bold))))

   `(org-upcoming-deadline
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal
                                              :underline nil))))

   `(org-warning
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :weight normal
                                          :underline nil))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange-d
                                              :weight normal
                                              :underline nil))))

   ;; org-habit (clear=blue, ready=green, alert=yellow, overdue=red. future=lower contrast)
   `(org-habit-clear-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue-lc
                                          :foreground ,sonokai-shusia-blue-hc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue-lc
                                              :foreground ,sonokai-shusia-256-blue-hc))))

   `(org-habit-clear-future-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue-lc))))

   `(org-habit-ready-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-lc
                                          :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-lc
                                              :foreground ,sonokai-shusia-256-green))))

   `(org-habit-ready-future-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green-lc))))

   `(org-habit-alert-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-yellow-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-yellow-lc))))

   `(org-habit-alert-future-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow-lc))))

   `(org-habit-overdue-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red
                                          :foreground ,sonokai-shusia-red-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red
                                              :foreground ,sonokai-shusia-256-red-lc))))

   `(org-habit-overdue-future-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red-lc))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red-lc))))

   ;; latest additions
   `(org-agenda-dimmed-todo-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(org-agenda-restriction-lock
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow))))

   `(org-clock-overlay
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow))))

   `(org-column
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :strike-through nil
                                          :underline nil
                                          :slant normal
                                          :weight normal
                                          :inherit default))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :strike-through nil
                                              :underline nil
                                              :slant normal
                                              :weight normal
                                              :inherit default))))

   `(org-column-title
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :underline t
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :underline t
                                              :weight bold))))

   `(org-date-selected
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :inverse-video t))))

   `(org-document-info
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(org-document-title
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :weight bold
                                          :height ,sonokai-shusia-height-plus-4))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :weight bold
                                              :height ,sonokai-shusia-height-plus-4))))

   `(org-drawer
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(org-footnote
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :underline t))))

   `(org-latex-and-export-specials
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(org-mode-line-clock-overrun
     ((,sonokai-shusia-class (:inherit mode-line))
      (,sonokai-shusia-256-class (:inherit mode-line))))

   ;; outline
   `(outline-1
     ((,sonokai-shusia-class (:inherit org-level-1))
      (,sonokai-shusia-256-class (:inherit org-level-1))))

   `(outline-2
     ((,sonokai-shusia-class (:inherit org-level-2))
      (,sonokai-shusia-256-class (:inherit org-level-2))))

   `(outline-3
     ((,sonokai-shusia-class (:inherit org-level-3))
      (,sonokai-shusia-256-class (:inherit org-level-3))))

   `(outline-4
     ((,sonokai-shusia-class (:inherit org-level-4))
      (,sonokai-shusia-256-class (:inherit org-level-4))))

   `(outline-5
     ((,sonokai-shusia-class (:inherit org-level-5))
      (,sonokai-shusia-256-class (:inherit org-level-5))))

   `(outline-6
     ((,sonokai-shusia-class (:inherit org-level-6))
      (,sonokai-shusia-256-class (:inherit org-level-6))))

   `(outline-7
     ((,sonokai-shusia-class (:inherit org-level-7))
      (,sonokai-shusia-256-class (:inherit org-level-7))))

   `(outline-8
     ((,sonokai-shusia-class (:inherit org-level-8))
      (,sonokai-shusia-256-class (:inherit org-level-8))))

   ;; parenface
   `(paren-face
     ((,sonokai-shusia-256-class (:foreground ,sonokai-shusia-comments))))

   ;; perspective
   `(persp-selected-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :weight bold))))

   ;; pretty-mode
   `(pretty-mode-symbol-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight normal))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight normal))))

   ;; popup
   `(popup-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(popup-isearch-match
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green))))

   `(popup-menu-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(popup-menu-mouse-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(popup-menu-selection-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-magenta
                                              :foreground ,sonokai-shusia-256-background))))

   `(popup-scroll-bar-background-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-comments))))

   `(popup-scroll-bar-foreground-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-emphasis))))

   `(popup-tip-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(rainbow-delimiters-depth-2-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(rainbow-delimiters-depth-3-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(rainbow-delimiters-depth-4-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(rainbow-delimiters-depth-5-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(rainbow-delimiters-depth-6-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(rainbow-delimiters-depth-7-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(rainbow-delimiters-depth-8-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(rainbow-delimiters-depth-9-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(rainbow-delimiters-depth-10-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(rainbow-delimiters-depth-11-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(rainbow-delimiters-depth-12-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(rainbow-delimiters-unmatched-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-background
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-background
                                              :inverse-video t))))

   ;; realgud
   `(realgud-overlay-arrow1
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-d))))

   `(realgud-overlay-arrow2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow-d))))

   `(realgud-overlay-arrow3
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange-d))))

   `(realgud-bp-enabled-face
     ((,sonokai-shusia-class (:inherit error))
      (,sonokai-shusia-256-class (:inherit error))))

   `(realgud-bp-disabled-face
     ((,sonokai-shusia-class (:inherit secondary-selection))
      (,sonokai-shusia-256-class (:inherit secondary-selection))))

   `(realgud-bp-line-enabled-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-d))))

   `(realgud-bp-line-disabled-face
     ((,sonokai-shusia-class (:inherit secondary-selection))
      (,sonokai-shusia-256-class (:inherit secondary-selection))))

   `(realgud-line-number
     ((,sonokai-shusia-class (:inherit sonokai-shusia-line-number))
      (,sonokai-shusia-256-class (:inherit sonokai-shusia-line-number))))

   `(realgud-backtrace-number
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-d
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   ;; rhtm-mode
   `(erb-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background))))

   `(erb-delim-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :background ,sonokai-shusia-256-background))))

   `(erb-exec-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background))))

   `(erb-exec-delim-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :background ,sonokai-shusia-256-background))))

   `(erb-out-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background))))

   `(erb-out-delim-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :background ,sonokai-shusia-256-background))))

   `(erb-comment-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background))))

   `(erb-comment-delim-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :background ,sonokai-shusia-256-background))))

   ;; rst-mode
   `(rst-level-1-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-background))))

   `(rst-level-2-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-cyan
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-cyan
                                              :foreground ,sonokai-shusia-256-background))))

   `(rst-level-3-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background))))

   `(rst-level-4-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-violet
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-violet
                                              :foreground ,sonokai-shusia-256-background))))

   `(rst-level-5-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-magenta
                                              :foreground ,sonokai-shusia-256-background))))

   `(rst-level-6-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red
                                          :foreground ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red
                                              :foreground ,sonokai-shusia-256-background))))

   ;; rpm-mode
   `(rpm-spec-dir-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(rpm-spec-doc-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(rpm-spec-ghost-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(rpm-spec-macro-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(rpm-spec-obsolete-tag-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(rpm-spec-package-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(rpm-spec-section-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(rpm-spec-tag-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(rpm-spec-var-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; sh-mode
   `(sh-quoted-exec
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :weight bold))))

   `(sh-escaped-newline
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   `(sh-heredoc
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :weight bold))))

   ;; smartparens
   `(sp-pair-overlay-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(sp-wrap-overlay-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(sp-wrap-tag-overlay-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(sp-show-pair-enclosing
     ((,sonokai-shusia-class (:inherit highlight))
      (,sonokai-shusia-256-class (:inherit highlight))))

   `(sp-show-pair-match-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   `(sp-show-pair-mismatch-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   ;; show-paren
   `(show-paren-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   `(show-paren-mismatch
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   ;; mic-paren
   `(paren-face-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   `(paren-face-mismatch
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   `(paren-face-no-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background
                                          :weight normal
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background
                                              :weight normal
                                              :inverse-video t))))

   ;; SLIME
   `(slime-repl-inputed-output-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; smerge
   `(smerge-base
     ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-blue-base))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-blue-base))))
   `(smerge-upper
     ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-red-base))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-red-base))))
   `(smerge-lower
     ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-green-base))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-green-base))))
   ;; WARNING: defining this face will overwrite the next two when displaying a
   ;; smerge diff in a file.
   ;; `(smerge-refined-changed
   ;;    ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-blue-emphasis))
   ;;      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-blue-emphasis))))
   `(smerge-refined-added
     ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-green-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-green-emphasis))))
   `(smerge-refined-removed
     ((,sonokai-shusia-class (:background ,sonokai-shusia-diff-red-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-diff-red-emphasis))))

   ;; speedbar
   `(speedbar-button-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-comments))))

   `(speedbar-directory-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-blue))))

   `(speedbar-file-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-foreground))))

   `(speedbar-highlight-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :background ,sonokai-shusia-256-highlight-line))))

   `(speedbar-selected-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-yellow
                                       :underline t))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-yellow
                                           :underline t))))

   `(speedbar-separator-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :background ,sonokai-shusia-blue
                                       :foreground ,sonokai-shusia-background
                                       :overline ,sonokai-shusia-cyan-lc))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :background ,sonokai-shusia-256-blue
                                           :foreground ,sonokai-shusia-256-background
                                           :overline ,sonokai-shusia-256-cyan-lc))))

   `(speedbar-tag-face
     ((,sonokai-shusia-class (:inherit ,sonokai-shusia-pitch
                                       :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:inherit ,sonokai-shusia-pitch
                                           :foreground ,sonokai-shusia-256-green))))

   ;; sunrise commander headings
   `(sr-active-path-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-blue
                                          :foreground ,sonokai-shusia-background
                                          :height ,sonokai-shusia-height-plus-1
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-blue
                                              :foreground ,sonokai-shusia-256-background
                                              :height ,sonokai-shusia-height-plus-1
                                              :weight bold))))

   `(sr-editing-path-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow
                                          :foreground ,sonokai-shusia-background
                                          :weight bold
                                          :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold
                                              :height ,sonokai-shusia-height-plus-1))))

   `(sr-highlight-path-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-green
                                          :foreground ,sonokai-shusia-background
                                          :weight bold
                                          :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-green
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold
                                              :height ,sonokai-shusia-height-plus-1))))

   `(sr-passive-path-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-comments
                                          :foreground ,sonokai-shusia-background
                                          :weight bold
                                          :height ,sonokai-shusia-height-plus-1))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-comments
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold
                                              :height ,sonokai-shusia-height-plus-1))))

   ;; sunrise commander marked
   `(sr-marked-dir-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-marked))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-marked))))

   `(sr-marked-file-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-marked))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-marked))))

   `(sr-alt-marked-dir-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta
                                          :foreground ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-magenta
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold))))

   `(sr-alt-marked-file-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-magenta
                                          :foreground ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-magenta
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold))))

   ;; sunrise commander fstat
   `(sr-directory-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-directory
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-directory
                                           :weight normal))))

   `(sr-symlink-directory-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-directory
                                       :slant italic
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-directory
                                           :slant italic
                                           :weight normal))))

   `(sr-symlink-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-symlink
                                       :slant italic
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-symlink
                                           :slant italic
                                           :weight normal))))

   `(sr-broken-link-face
     ((,sonokai-shusia-class (:inherit disonokai-shusia-red-warning
                                       :slant italic
                                       :weight normal))
      (,sonokai-shusia-256-class (:inherit disonokai-shusia-red-warning
                                           :slant italic
                                           :weight normal))))

   ;; sunrise commander file types
   `(sr-compressed-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(sr-encrypted-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(sr-log-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(sr-packaged-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(sr-html-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(sr-xml-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   ;; sunrise commander misc
   `(sr-clex-hotchar-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red
                                          :foreground ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red
                                              :foreground ,sonokai-shusia-256-background
                                              :weight bold))))

   ;; syslog-mode
   `(syslog-ip-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-yellow))))

   `(syslog-hour-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-green))))

   `(syslog-error-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   `(syslog-warn-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-orange
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-orange
                                              :weight bold))))

   `(syslog-info-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-blue
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-blue
                                              :weight bold))))

   `(syslog-debug-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-cyan
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-cyan
                                              :weight bold))))

   `(syslog-su-face
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-magenta))))

   ;; table
   `(table-cell
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :background ,sonokai-shusia-256-highlight-line))))

   ;; term
   `(term-color-black
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray
                                          :background ,sonokai-shusia-gray-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray
                                              :background ,sonokai-shusia-256-gray-d))))

   `(term-color-red
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-red-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-red-d))))

   `(term-color-green
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-green-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-green-d))))

   `(term-color-yellow
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-yellow-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-yellow-d))))

   `(term-color-blue
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-blue-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-blue-d))))

   `(term-color-magenta
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta
                                          :background ,sonokai-shusia-magenta-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :background ,sonokai-shusia-256-magenta-d))))

   `(term-color-cyan
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan
                                          :background ,sonokai-shusia-cyan-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan
                                              :background ,sonokai-shusia-256-cyan-d))))

   `(term-color-white
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-foreground))))

   `(term-default-fg-color
     ((,sonokai-shusia-class (:inherit term-color-white))
      (,sonokai-shusia-256-class (:inherit term-color-white))))

   `(term-default-bg-color
     ((,sonokai-shusia-class (:inherit term-color-black))
      (,sonokai-shusia-256-class (:inherit term-color-black))))

   ;; tooltip. (NOTE: This setting has no effect on the os widgets for me
   ;; zencoding uses this)
   `(tooltip
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-d
                                          :foreground ,sonokai-shusia-emphasis
                                          :inherit ,sonokai-shusia-pitch))))

   ;; treemacs
   `(treemacs-directory-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))

   `(treemacs-header-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-background
                                          :underline t
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-background
                                              :underline t
                                              :weight bold))))

   `(treemacs-git-modified-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background))))

   `(treemacs-git-renamed-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background))))

   `(treemacs-git-ignored-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-l
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-l
                                              :background ,sonokai-shusia-256-background))))

   `(treemacs-git-untracked-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :background ,sonokai-shusia-256-background))))

   `(treemacs-git-added-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :background ,sonokai-shusia-256-background))))

   `(treemacs-git-conflict-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange
                                              :background ,sonokai-shusia-256-background))))

   ;; tuareg
   `(tuareg-font-lock-governing-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta
                                              :weight bold))))

   `(tuareg-font-lock-multistage-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :background ,sonokai-shusia-highlight-line
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :background ,sonokai-shusia-256-highlight-line
                                              :weight bold))))

   `(tuareg-font-lock-operator-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis))))

   `(tuareg-font-lock-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :background ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :background ,sonokai-shusia-256-red
                                              :weight bold))))

   `(tuareg-font-lock-interactive-output-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-cyan))))

   `(tuareg-font-lock-interactive-error-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   ;; undo-tree
   `(undo-tree-visualizer-default-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-background))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-background))))

   `(undo-tree-visualizer-unmodified-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(undo-tree-visualizer-current-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue
                                              :inverse-video t))))

   `(undo-tree-visualizer-active-branch-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :background ,sonokai-shusia-background
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :background ,sonokai-shusia-256-background
                                              :weight bold))))

   `(undo-tree-visualizer-register-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   ;; volatile highlights
   `(vhl/default-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-alt))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-alt))))

   ;; w3m
   `(w3m-anchor
     ((,sonokai-shusia-class (:inherit link))
      (,sonokai-shusia-256-class (:inherit link))))

   `(w3m-arrived-anchor
     ((,sonokai-shusia-class (:inherit link-visited))
      (,sonokai-shusia-256-class (:inherit link-visited))))

   `(w3m-form
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(w3m-header-line-location-title
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-yellow))))

   `(w3m-header-line-location-content

     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(w3m-bold
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :weight bold))))

   `(w3m-image-anchor
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-cyan
                                          :inherit link))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-cyan
                                              :inherit link))))

   `(w3m-image
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-cyan))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-cyan))))

   `(w3m-lnum-minibuffer-prompt
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis))))

   `(w3m-lnum-match
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line))))

   `(w3m-lnum
     ((,sonokai-shusia-class (:underline nil
                                         :bold nil
                                         :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:underline nil
                                             :bold nil
                                             :foreground ,sonokai-shusia-256-red))))

   `(w3m-session-select
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(w3m-session-selected
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :bold t
                                          :underline t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :bold t
                                              :underline t))))

   `(w3m-tab-background
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(w3m-tab-selected-background
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(w3m-tab-mouse
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-yellow))))

   `(w3m-tab-selected
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-emphasis
                                          :bold t))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :bold t))))

   `(w3m-tab-unselected
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(w3m-tab-selected-retrieving
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-red))))

   `(w3m-tab-unselected-retrieving
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-orange))))

   `(w3m-tab-unselected-unseen
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :foreground ,sonokai-shusia-256-violet))))

   ;; web-mode
   `(web-mode-builtin-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(web-mode-comment-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(web-mode-constant-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(web-mode-current-element-highlight-face
     ((,sonokai-shusia-class (:underline unspecified
                                         :weight unspecified
                                         :background ,sonokai-shusia-highlight-line))
      (,sonokai-shusia-256-class (:underline unspecified
                                             :weight unspecified
                                             :background ,sonokai-shusia-256-highlight-line))))

   `(web-mode-doctype-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :slant italic
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :slant italic
                                              :weight bold))))

   `(web-mode-folded-face
     ((,sonokai-shusia-class (:underline t))
      (,sonokai-shusia-256-class (:underline t))))

   `(web-mode-function-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(web-mode-html-attr-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(web-mode-html-attr-custom-face
     ((,sonokai-shusia-class (:inherit web-mode-html-attr-name-face))
      (,sonokai-shusia-256-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-engine-face
     ((,sonokai-shusia-class (:inherit web-mode-block-delimiter-face))
      (,sonokai-shusia-256-class (:inherit web-mode-block-delimiter-face))))

   `(web-mode-html-attr-equal-face
     ((,sonokai-shusia-class (:inherit web-mode-html-attr-name-face))
      (,sonokai-shusia-256-class (:inherit web-mode-html-attr-name-face))))

   `(web-mode-html-attr-value-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(web-mode-html-tag-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(web-mode-html-tag-bracket-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray))))

   `(web-mode-keyword-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(web-mode-preprocessor-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow
                                          :slant normal
                                          :weight unspecified))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow
                                              :slant normal
                                              :weight unspecified))))

   `(web-mode-string-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(web-mode-type-face
     ((,sonokai-shusia-class (:inherit font-lock-type-face))
      (,sonokai-shusia-256-class (:inherit font-lock-type-face))))

   `(web-mode-variable-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(web-mode-warning-face
     ((,sonokai-shusia-class (:inherit font-lock-warning-face))
      (,sonokai-shusia-256-class (:inherit font-lock-warning-face))))

   `(web-mode-block-face
     ((,sonokai-shusia-class (:background unspecified))
      (,sonokai-shusia-256-class (:background unspecified))))

   `(web-mode-block-delimiter-face
     ((,sonokai-shusia-class (:inherit font-lock-preprocessor-face))
      (,sonokai-shusia-256-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-comment-face
     ((,sonokai-shusia-class (:inherit web-mode-comment-face))
      (,sonokai-shusia-256-class (:inherit web-mode-comment-face))))

   `(web-mode-block-control-face
     ((,sonokai-shusia-class (:inherit font-lock-preprocessor-face))
      (,sonokai-shusia-256-class (:inherit font-lock-preprocessor-face))))

   `(web-mode-block-string-face
     ((,sonokai-shusia-class (:inherit web-mode-string-face))
      (,sonokai-shusia-256-class (:inherit web-mode-string-face))))

   `(web-mode-comment-keyword-face
     ((,sonokai-shusia-class (:box 1 :weight bold))
      (,sonokai-shusia-256-class (:box 1 :weight bold))))

   `(web-mode-css-at-rule-face
     ((,sonokai-shusia-class (:inherit font-lock-constant-face))
      (,sonokai-shusia-256-class (:inherit font-lock-constant-face))))

   `(web-mode-css-pseudo-class-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-color-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-filter-face
     ((,sonokai-shusia-class (:inherit font-lock-function-name-face))
      (,sonokai-shusia-256-class (:inherit font-lock-function-name-face))))

   `(web-mode-css-function-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-function-call-face
     ((,sonokai-shusia-class (:inherit font-lock-function-name-face))
      (,sonokai-shusia-256-class (:inherit font-lock-function-name-face))))

   `(web-mode-css-priority-face
     ((,sonokai-shusia-class (:inherit font-lock-builtin-face))
      (,sonokai-shusia-256-class (:inherit font-lock-builtin-face))))

   `(web-mode-css-property-name-face
     ((,sonokai-shusia-class (:inherit font-lock-variable-name-face))
      (,sonokai-shusia-256-class (:inherit font-lock-variable-name-face))))

   `(web-mode-css-selector-face
     ((,sonokai-shusia-class (:inherit font-lock-keyword-face))
      (,sonokai-shusia-256-class (:inherit font-lock-keyword-face))))

   `(web-mode-css-string-face
     ((,sonokai-shusia-class (:inherit web-mode-string-face))
      (,sonokai-shusia-256-class (:inherit web-mode-string-face))))

   `(web-mode-javascript-string-face
     ((,sonokai-shusia-class (:inherit web-mode-string-face))
      (,sonokai-shusia-256-class (:inherit web-mode-string-face))))

   `(web-mode-json-comment-face
     ((,sonokai-shusia-class (:inherit web-mode-comment-face))
      (,sonokai-shusia-256-class (:inherit web-mode-comment-face))))

   `(web-mode-json-context-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(web-mode-json-key-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(web-mode-json-string-face
     ((,sonokai-shusia-class (:inherit web-mode-string-face))
      (,sonokai-shusia-256-class (:inherit web-mode-string-face))))

   `(web-mode-param-name-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(web-mode-part-comment-face
     ((,sonokai-shusia-class (:inherit web-mode-comment-face))
      (,sonokai-shusia-256-class (:inherit web-mode-comment-face))))

   `(web-mode-part-face
     ((,sonokai-shusia-class (:inherit web-mode-block-face))
      (,sonokai-shusia-256-class (:inherit web-mode-block-face))))

   `(web-mode-part-string-face
     ((,sonokai-shusia-class (:inherit web-mode-string-face))
      (,sonokai-shusia-256-class (:inherit web-mode-string-face))))

   `(web-mode-symbol-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-violet))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-violet))))

   `(web-mode-whitespace-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red))))

   ;; whitespace-mode
   `(whitespace-space
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-background-l
                                          :inverse-video unspecified
                                          :slant italic))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-background-l
                                              :inverse-video unspecified
                                              :slant italic))))

   `(whitespace-hspace
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-emphasis
                                          :inverse-video unspecified))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-emphasis
                                              :inverse-video unspecified))))

   `(whitespace-tab
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-red
                                          :inverse-video unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-red
                                              :inverse-video unspecified
                                              :weight bold))))

   `(whitespace-newline
     ((,sonokai-shusia-class(:background unspecified
                                         :foreground ,sonokai-shusia-comments
                                         :inverse-video unspecified))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-comments
                                              :inverse-video unspecified))))

   `(whitespace-trailing
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-orange-lc
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-orange-lc
                                              :inverse-video t))))

   `(whitespace-line
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-magenta
                                          :inverse-video unspecified))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-magenta
                                              :inverse-video unspecified))))

   `(whitespace-space-before-tab
     ((,sonokai-shusia-class (:background ,sonokai-shusia-red-lc
                                          :foreground unspecified
                                          :inverse-video unspecified))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-red-lc
                                              :foreground unspecified
                                              :inverse-video unspecified))))

   `(whitespace-indentation
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-yellow
                                          :inverse-video unspecified
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-yellow
                                              :inverse-video unspecified
                                              :weight bold))))

   `(whitespace-empty
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-red-lc
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-red-lc
                                              :inverse-video t))))

   `(whitespace-space-after-tab
     ((,sonokai-shusia-class (:background unspecified
                                          :foreground ,sonokai-shusia-orange
                                          :inverse-video t
                                          :weight bold))
      (,sonokai-shusia-256-class (:background unspecified
                                              :foreground ,sonokai-shusia-256-orange
                                              :inverse-video t
                                              :weight bold))))

   ;; wanderlust
   `(wl-highlight-folder-few-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(wl-highlight-folder-many-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(wl-highlight-folder-path-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange))))

   `(wl-highlight-folder-unread-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-folder-zero-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(wl-highlight-folder-unknown-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-message-citation-header
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(wl-highlight-message-cited-text-1
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(wl-highlight-message-cited-text-2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-cited-text-3
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-message-cited-text-4
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-message-header-contents-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-headers-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red))))

   `(wl-highlight-message-important-header-contents
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-header-contents
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-important-header-contents2
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-signature
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   `(wl-highlight-message-unimportant-header-contents
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(wl-highlight-summary-answesonokai-shusia-red-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-summary-disposed-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground
                                          :slant italic))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground
                                              :slant italic))))

   `(wl-highlight-summary-new-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-blue))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-blue))))

   `(wl-highlight-summary-normal-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(wl-highlight-summary-thread-top-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow))))

   `(wl-highlight-thread-indent-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-magenta))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-magenta))))

   `(wl-highlight-summary-refiled-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(wl-highlight-summary-displaying-face
     ((,sonokai-shusia-class (:underline t
                                         :weight bold))
      (,sonokai-shusia-256-class (:underline t
                                             :weight bold))))

   ;; weechat
   `(weechat-error-face
     ((,sonokai-shusia-class (:inherit error))
      (,sonokai-shusia-256-class (:inherit error))))

   `(weechat-highlight-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-emphasis
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-emphasis
                                              :weight bold))))

   `(weechat-nick-self-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight unspecified
                                          :inverse-video t))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight unspecified
                                              :inverse-video t))))

   `(weechat-prompt-face
     ((,sonokai-shusia-class (:inherit minibuffer-prompt))
      (,sonokai-shusia-256-class (:inherit minibuffer-prompt))))

   `(weechat-time-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   ;; which-func-mode
   `(which-func
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   ;; which-key
   `(which-key-key-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green
                                              :weight bold))))

   `(which-key-separator-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(which-key-note-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments))))

   `(which-key-command-description-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-foreground))))

   `(which-key-local-map-description-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-yellow-hc))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-yellow-hc))))

   `(which-key-group-description-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red
                                          :weight bold))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red
                                              :weight bold))))

   ;; window-divider-mode
   `(window-divider
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-highlight))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-highlight))))
   `(window-divider-first-pixel ((t (:inherit window-divider))))
   `(window-divider-last-pixel ((t (:inherit window-divider))))

   ;; window-number-mode
   `(window-number-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green))))

   ;; yascroll
   `(yascroll:thumb-text-area
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-comments))))

   `(yascroll:thumb-fringe
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-comments
                                          :background ,sonokai-shusia-comments))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-comments
                                              :background ,sonokai-shusia-256-comments))))

   ;; zencoding
   `(zencoding-preview-input
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight-line
                                          :box ,sonokai-shusia-emphasis))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight-line
                                              :box ,sonokai-shusia-256-emphasis))))

   ;; corfu
   `(corfu-default
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-d))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-d))))

   `(corfu-current
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(corfu-border
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   `(corfu-bar
     ((,sonokai-shusia-class (:background ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-yellow))))

   ;; corfu-candidate-overlay
   `(corfu-candidate-overlay-face
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-gray-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-gray-d))))

   `(corfu-candidate-overlay-face-exact-match
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-white-d))
      (,sonokai-shusia-256-class (:foreground, sonokai-shusia-256-white-d))))

   ;; mozc-posframe
   `(mozc-cand-posframe-normal-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-background-d
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-background-d
                                              :foreground ,sonokai-shusia-foreground))))

   `(mozc-cand-posframe-focused-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-highlight
                                          :foreground ,sonokai-shusia-foreground))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-highlight
                                              :foreground ,sonokai-shusia-256-foreground))))

   `(mozc-cand-posframe-footer-face
     ((,sonokai-shusia-class (:inherit mozc-cand-posframe-normal-face
                                       :foreground ,sonokai-shusia-yellow))
      (,sonokai-shusia-256-class (:inherit mozc-cand-posframe-normal-face
                                           :foreground ,sonokai-shusia-256-yellow))))

   `(mozc-cand-posframe-border-face
     ((,sonokai-shusia-class (:background ,sonokai-shusia-gray))
      (,sonokai-shusia-256-class (:background ,sonokai-shusia-256-gray))))

   ;; ext-tab-bar
   `(ext-tab-bar-faces-debug
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-red-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-red-d))))

   `(ext-tab-bar-faces-project
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-green-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-green-d))))

   `(ext-tab-bar-faces-perspective
     ((,sonokai-shusia-class (:foreground ,sonokai-shusia-orange-d))
      (,sonokai-shusia-256-class (:foreground ,sonokai-shusia-256-orange-d))))
   )

  (custom-theme-set-variables
   'sonokai-shusia
   `(ansi-color-names-vector [,sonokai-shusia-background ,sonokai-shusia-red ,sonokai-shusia-green ,sonokai-shusia-yellow
                                                         ,sonokai-shusia-blue ,sonokai-shusia-magenta ,sonokai-shusia-cyan
                                                         ,sonokai-shusia-foreground])

   ;; compilation
   `(compilation-message-face 'default)

   ;; fill-column-indicator
   `(fci-rule-color ,sonokai-shusia-highlight-line)

   ;; magit
   `(magit-diff-use-overlays nil)

   ;; highlight-changes
   `(highlight-changes-colors '(,sonokai-shusia-magenta ,sonokai-shusia-violet))

   ;; highlight-tail
   `(highlight-tail-colors
     '((,sonokai-shusia-highlight-line . 0)
       (,sonokai-shusia-green-lc . 20)
       (,sonokai-shusia-cyan-lc . 30)
       (,sonokai-shusia-blue-lc . 50)
       (,sonokai-shusia-yellow-lc . 60)
       (,sonokai-shusia-orange-lc . 70)
       (,sonokai-shusia-magenta-lc . 85)
       (,sonokai-shusia-highlight-line . 100)))

   ;; pos-tip
   `(pos-tip-foreground-color ,sonokai-shusia-emphasis)
   `(pos-tip-background-color ,sonokai-shusia-bg-alt-d)

   ;; vc
   `(vc-annotate-color-map
     '((20 . "#870000")
       (40 . "#CF4F1F")
       (60 . "#C26C0F")
       (80 . "#CDC673")
       (100 . "#AB8C00")
       (120 . "#A18F00")
       (140 . "#989200")
       (160 . "#8E9500")
       (180 . "#AFD700")
       (200 . "#729A1E")
       (220 . "#609C3C")
       (240 . "#4E9D5B")
       (260 . "#3C9F79")
       (280 . "#5FAFAF")
       (300 . "#299BA6")
       (320 . "#2896B5")
       (340 . "#2790C3")
       (360 . "#0084DC")))
   `(vc-annotate-very-old-color nil)
   `(vc-annotate-background nil)

   ;; weechat
   `(weechat-color-list
     '(unspecified ,sonokai-shusia-background ,sonokai-shusia-highlight-line
                   ,sonokai-shusia-red-d ,sonokai-shusia-red
                   ,sonokai-shusia-green-d ,sonokai-shusia-green
                   ,sonokai-shusia-yellow-d ,sonokai-shusia-yellow
                   ,sonokai-shusia-blue-d ,sonokai-shusia-blue
                   ,sonokai-shusia-magenta-d ,sonokai-shusia-magenta
                   ,sonokai-shusia-cyan-d ,sonokai-shusia-cyan
                   ,sonokai-shusia-foreground ,sonokai-shusia-emphasis)))
  )

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'sonokai-shusia)

;;; sonokai-shusia-theme.el ends here
