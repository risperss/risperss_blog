(lang dune 3.19)

(name risperss_blog)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name risperss_blog)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml yocaml yocaml_omd yocaml_jingoo yocaml_yaml yocaml_syndication yocaml_unix)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
