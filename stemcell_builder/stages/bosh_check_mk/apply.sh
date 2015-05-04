#!/usr/bin/env bash
#

set -e

base_dir=$(readlink -nf $(dirname $0)/../..)
source $base_dir/lib/prelude_apply.bash
source $base_dir/lib/prelude_bosh.bash

cd $assets_dir

# Download and install inet using package manager
pkg_mgr install xinetd

# Install check-mk agent
run_in_bosh_chroot $chroot "dpkg -i check-mk-agent_1.2.4p5-2_all.deb"
