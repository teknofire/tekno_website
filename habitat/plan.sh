pkg_name=tekno_website
pkg_origin=will
pkg_version="0.2.0"
pkg_maintainer="Will Fisher <will@teknofire.net>"
pkg_license=("Apache-2.0")
pkg_deps=(core/nginx)
pkg_build_deps=(core/hugo)
pkg_exports=(
  [port]=http.listen.port
)
pkg_exposes=(port)
pkg_svc_user="root"

do_build() {
  return 0
}

do_install() {
  local app_path
  app_path=${pkg_prefix}/app

  mkdir -p $app_path

  hugo --cleanDestinationDir \
    -d $app_path
}
