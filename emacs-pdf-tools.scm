;; guix install emacs-pdf-tools --with-git-url=emacs-pdf-tools=https://github.com/tpeacock19/pdf-tools --with-commit=emacs-pdf-tools=eb6d40663069f2b7e6b52e907eeaa4e37375feb6

(use-modules
 (ice-9 popen)
 (ice-9 rdelim)
 (guix build utils)
 (guix gexp)
 (guix git-download)
 (guix build-system gnu)
 (guix packages)
 (gnu packages autotools)
 (gnu packages emacs)
 (gnu packages emacs-xyz)
 (gnu packages pkg-config)
 (gnu packages texinfo))

(define emacs-pdf-tools-dev
  (let ((commit "c510442ab89c8a9e9881230eeb364f4663f59e76")
        (revision "1"))
    (package
     (inherit emacs-pdf-tools)
     (name "emacs-pdf-tools")
     (version (git-version "0.90" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/tpeacock19/pdf-tools")
             (commit commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "17z3cpn76g9dp62drjrgrqpp1bgf4gl5k5gspylskpvd4kj4bq4d"))))
     (home-page "https://github.com/tpeacock/pdf-tools"))))

emacs-pdf-tools-dev

;;; emacs-pdf-tools.scm ends here

