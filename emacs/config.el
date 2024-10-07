;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ephemeral)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "Hurmit Nerd Font" :size 16))

(require 'org-modern)
(add-hook 'org-mode-hook #'org-modern-mode)

(require 'vertico-posframe)
(vertico-posframe-mode 1)

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Customize Org Mode heading sizes without changing colors
(dolist (face '((org-level-1 . 1.5)
                (org-level-2 . 1.3)
                (org-level-3 . 1.2)
                (org-level-4 . 1.1)
                (org-level-5 . 1.0)
                (org-level-6 . 1.0)
                (org-level-7 . 1.0)
                (org-level-8 . 1.0)))
  (set-face-attribute (car face) nil :height (cdr face)))

(setq +doom-dashboard-ascii-banner-fn t)

(display-battery-mode 1)  ;; Enable battery display in the mode line
(display-time-mode 1)  ;; Enable time display in the mode line
(setq display-time-format "%H:%M")  ;; ISO 8601 format
(setq display-time-default-load-average nil)     ;; Hide load average

(set-face-attribute 'org-level-1 nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Cyan dominant
(set-face-attribute 'org-level-2 nil :foreground "#FFFF00" :background "#5B5B00" :weight 'bold)  ;; Yellow dominant
(set-face-attribute 'org-level-3 nil :foreground "#00CED1" :background "#003D47" :weight 'bold)  ;; Dark cyan
(set-face-attribute 'org-level-4 nil :foreground "#FFD700" :background "#5B4A08" :weight 'bold)  ;; Yellow gold
(set-face-attribute 'org-level-5 nil :foreground "#40E0D0" :background "#065465" :weight 'bold)  ;; Turquoise
(set-face-attribute 'org-level-6 nil :foreground "#E0FFFF" :background "#204040" :weight 'bold)  ;; Light cyan

(setq persp-emacsclient-init-frame-behaviour-override "main")

;; Function to open PDFs with Zathura
(defun open-pdf-with-zathura (file)
  "Open the specified PDF file with Zathura."
  (start-process "zathura" nil "zathura" file))

;; Use Zathura for opening PDFs in Dired mode or when opening a PDF
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . default))
(setq dired-guess-shell-alist-user
      '(("\\.pdf\\'" "zathura")))

;; Automatically open PDFs with Zathura when clicking on a PDF file in Emacs
(add-hook 'find-file-hook
          (lambda ()
            (when (string-match "\\.pdf\\'" buffer-file-name)
              (open-pdf-with-zathura buffer-file-name)
              (kill-buffer))))

(add-hook 'window-setup-hook #'treemacs 'append)
