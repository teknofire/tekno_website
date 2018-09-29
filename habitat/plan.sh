pkg_name=tekno_website
pkg_origin=will
pkg_version="0.1.0"
pkg_maintainer="Will Fisher <will@teknofire.net>"
pkg_license=("Apache-2.0")
# pkg_source="http://some_source_url/releases/${pkg_name}-${pkg_version}.tar.gz"
# pkg_filename="${pkg_name}-${pkg_version}.tar.gz"
# pkg_shasum="TODO"
pkg_deps=(core/hugo)
# pkg_build_deps=(core/hugo)
# pkg_lib_dirs=(lib)
# pkg_include_dirs=(include)
# pkg_bin_dirs=(bin)
# pkg_pconfig_dirs=(lib/pconfig)
# pkg_svc_run="haproxy -f $pkg_svc_config_path/haproxy.conf"
# pkg_svc_run="hugo serve -s $pkg_prefix/site"
# pkg_exports=(
#   [host]=srv.address
#   [port]=srv.port
#   [ssl-port]=srv.ssl.port
# )
pkg_exports=(
  [port]=server.port
)
# pkg_exposes=(port ssl-port)
# pkg_binds=(
#   [database]="port host"
# )
# pkg_binds_optional=(
#   [storage]="port host"
# )
# pkg_interpreters=(bin/bash)
pkg_svc_user="hab"
# pkg_svc_group="$pkg_svc_user"
# pkg_description="Some description."
# pkg_upstream_url="http://example.com/project-name"

do_build() {
  return 0
}

do_install() {
  local app_path
  app_path=${pkg_prefix}/app

  mkdir -p $app_path
  #
  # hugo --cleanDestinationDir \
  #   -d $app_path

  cp -rv archetypes \
    config.toml \
    content \
    data \
    layouts \
    public \
    resources \
    static \
    themes \
    $app_path
}
