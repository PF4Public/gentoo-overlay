# Build image for the release workflows: a stage3 base carrying a fresh,
# pre-synced portage tree, so no 'emerge --sync' is needed at build time.
#
# The official gentoo/stage3 image ships a portage snapshot that is stale by
# the time a build runs; the current workaround is a live 'emerge --sync' per
# build job (slow, and it can fail). The gentoo/portage image is kept in sync
# by Gentoo infra, so copying its tree in is both faster and more reliable.

# name the portage image
FROM gentoo/portage:latest AS portage

# based on the stage3 image
FROM gentoo/stage3:amd64-systemd

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo
