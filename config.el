;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ryner Reinhardt"
      user-mail-address "drryner@icloud.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(map! :leader
      :desc "Paredit move parens backwards"
      "[" #'sp-forward-barf-sexp)

(map! :leader
      :desc "Paredit move parens forward"
      "]" #'sp-forward-slurp-sexp)

(map! :leader
      :desc "Comment line"
      "c l" #'evilnc-comment-or-uncomment-lines)

;; Windows jump
(map! :leader
      :desc "Select 1-th window"
      "1" #'winum-select-window-1)

(map! :leader
      :desc "Select 2-th window"
      "2" #'winum-select-window-2)

(map! :leader
      :desc "Select 3-th window"
      "3" #'winum-select-window-3)

(map! :leader
      :desc "Select 4-th window"
      "4" #'winum-select-window-4)

;; Clojure
(map! :leader
      :desc "Connect clj&cljs"
      "\\" #'cider-jack-in-clj&cljs)

;; Scrolling and mouse support
(setq pixel-resolution-fine-flag t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)

(setq scroll-margin 1)
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 1)

(xterm-mouse-mode)
(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 2)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 2)))
(global-set-key [S-mouse-4] (lambda () (interactive) (scroll-down 6)))
(global-set-key [S-mouse-5] (lambda () (interactive) (scroll-up 6)))
(global-set-key [C-mouse-4] (lambda () (interactive) (scroll-down)))
(global-set-key [C-mouse-5] (lambda () (interactive) (scroll-up)))

;; Dissable quit banner
(setq confirm-kill-emacs nil)

;; Parens highlighting
(add-hook 'prog-mode-hook 'highlight-parentheses-mode)

(use-package! wakatime-mode
  :hook (after-init . global-wakatime-mode))

(setq wakatime-api-key "${WAKATIME_API_KEY}")

;; Set column line width
(setq-default fill-column 100)
