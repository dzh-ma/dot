;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

(setq doom-font (font-spec :family "Hurmit Nerd Font" :size 16))

(setq doom-theme 'doom-ephemeral)

(display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(set-face-attribute 'line-number nil :foreground "#00FFFF" :weight 'bold)
(set-face-attribute 'line-number-current-line nil :foreground "#000000" :background "#00FFFF" :weight 'bold)

(setq org-directory "~/org/")

(require 'org-modern)
(add-hook 'org-mode-hook #'org-modern-mode)

(require 'vertico-posframe)
(vertico-posframe-mode 1)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(defun my/org-babel-tangle-on-save ()
  (when (eq major-mode 'org-mode)
    (org-babel-tangle)))

(add-hook 'after-save-hook #'my/org-babel-tangle-on-save)

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
(setq display-time-default-load-average nil)  ;; Hide load average

(set-face-attribute 'org-level-1 nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Cyan dominant
(set-face-attribute 'org-level-2 nil :foreground "#FFFF00" :background "#5B5B00" :weight 'bold)  ;; Yellow dominant
(set-face-attribute 'org-level-3 nil :foreground "#00CED1" :background "#003D47" :weight 'bold)  ;; Dark cyan
(set-face-attribute 'org-level-4 nil :foreground "#FFD700" :background "#5B4A08" :weight 'bold)  ;; Yellow gold
(set-face-attribute 'org-level-5 nil :foreground "#40E0D0" :background "#065465" :weight 'bold)  ;; Turquoise
(set-face-attribute 'org-level-6 nil :foreground "#E0FFFF" :background "#204040" :weight 'bold)  ;; Light cyan

(set-face-attribute 'org-list-dt nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Light cyan

(setq persp-emacsclient-init-frame-behaviour-override "main")

(defun open-pdf-with-zathura (file)
  "Open the specified PDF file with Zathura."
  (start-process "zathura" nil "zathura" file))

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . default))
(setq dired-guess-shell-alist-user
      '(("\\.pdf\\'" "zathura")))

(add-hook 'find-file-hook
          (lambda ()
            (when (string-match "\\.pdf\\'" buffer-file-name)
              (open-pdf-with-zathura buffer-file-name)
              (kill-buffer))))

(add-hook 'window-setup-hook #'treemacs 'append)

(global-set-key (kbd "M-t") 'vterm)
(global-set-key (kbd "M-n"), 'next-line)
(global-set-key (kbd "M-p"), 'previous-line)
