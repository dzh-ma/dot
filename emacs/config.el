;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

(setq doom-font (font-spec :family "Input Mono" :size 16))

(setq doom-theme 'doom-lantern)

(display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(set-face-attribute 'line-number nil :foreground "#00FFFF" :weight 'bold)
(set-face-attribute 'line-number-current-line nil :foreground "#000000" :background "#00FFFF" :weight 'bold)

;; keep the cursor centered to avoid sudden scroll jumps
(require 'centered-cursor-mode)

;; disable in terminal modes
;; http://stackoverflow.com/a/6849467/519736
;; also disable in Info mode, because it breaks going back with the backspace key
(define-global-minor-mode my-global-centered-cursor-mode centered-cursor-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'Info-mode 'term-mode 'eshell-mode 'shell-mode 'erc-mode)))
      (centered-cursor-mode))))
(my-global-centered-cursor-mode 1)

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

;;(if (require 'toc-org nil t)
;;    (progn
;;      (add-hook 'org-mode-hook 'toc-org-mode)
;;
;;      ;; enable in markdown, too
;;      (add-hook 'markdown-mode-hook 'toc-org-mode)
;;      (define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point))
;;  (warn "toc-org not found"))

(dolist (face '((org-level-1 . 2.0)
                (org-level-2 . 1.8)
                (org-level-3 . 1.5)
                (org-level-4 . 1.3)
                (org-level-5 . 1.2)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :height (cdr face)))

(setq +doom-dashboard-ascii-banner-fn t)
(display-battery-mode 1)  ;; Enable battery display in the mode line
(display-time-mode 1)  ;; Enable time display in the mode line
(setq display-time-format "%H:%M")  ;; ISO 8601 format
(setq display-time-default-load-average nil)  ;; Hide load average

(set-face-attribute 'org-level-1 nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Cyan dominant
(set-face-attribute 'org-level-2 nil :foreground "#FFFF00" :background "#5B5B00" :weight 'bold)  ;; Yellow dominant
(set-face-attribute 'org-level-3 nil :foreground "#00FF00" :background "#1F4F16" :weight 'bold)  ;; Green dominant
(set-face-attribute 'org-level-4 nil :foreground "#FFD700" :background "#5B4A08" :weight 'bold)  ;; Yellow gold
(set-face-attribute 'org-level-5 nil :foreground "#40E0D0" :background "#065465" :weight 'bold)  ;; Turquoise
(set-face-attribute 'org-level-6 nil :foreground "#FF0000" :background "#52170B" :weight 'bold)  ;; Red dominant

(set-face-attribute 'org-list-dt nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Light cyan
(set-face-attribute 'org-table nil :foreground "#00FF00" :weight 'bold)                          ;; Green

(set-face-attribute 'markdown-header-face-1 nil :foreground "#00FFFF" :background "#004C4C" :weight 'bold)  ;; Cyan dominant
(set-face-attribute 'markdown-header-face-2 nil :foreground "#FFFF00" :background "#5B5B00" :weight 'bold)  ;; Yellow dominant
(set-face-attribute 'markdown-header-face-3 nil :foreground "#00FF00" :background "#1F4F16" :weight 'bold)  ;; Green dominant
(set-face-attribute 'markdown-header-face-4 nil :foreground "#FFD700" :background "#5B4A08" :weight 'bold)  ;; Yellow gold
(set-face-attribute 'markdown-header-face-5 nil :foreground "#40E0D0" :background "#065465" :weight 'bold)  ;; Turquoise
(set-face-attribute 'markdown-header-face-6 nil :foreground "#FF0000" :background "#52170B" :weight 'bold)  ;; Red dominant

(set-face-attribute 'markdown-bold-face nil :foreground "#00FFFF" :weight 'bold)
(set-face-attribute 'markdown-italic-face nil :foreground "#00FF00" :weight 'bold)

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


