all: services.ign

opengist.ign:
	butane services/opengist.bu > services/opengist.ign

sludgebin.ign:
	butane services/sludgebin.bu > services/sludgebin.ign

soju.ign:
	butane services/soju.bu > services/soju.ign

forgejo.ign:
	butane services/forgejo.bu > services/forgejo.ign

vaultwarden.ign:
	butane services/vaultwarden.bu > services/vaultwarden.ign

thelounge.ign:
	butane services/thelounge.bu > services/thelounge.ign

site.ign:
	butane services/site.bu > services/site.ign

mumble.ign:
	butane services/mumble.bu > services/mumble.ign

backups.ign:
	butane services/backups.bu > services/backups.ign

copyparty.ign:
	butane services/copyparty.bu > services/copyparty.ign

jellyfin.ign:
	butane services/jellyfin.bu > services/jellyfin.ign

headscale.ign:
	butane services/headscale.bu > services/headscale.ign

services.ign: opengist.ign sludgebin.ign soju.ign forgejo.ign vaultwarden.ign thelounge.ign site.ign mumble.ign backups.ign copyparty.ign jellyfin.ign headscale.ign
	butane -pd services/ services/services.bu > services/services.ign

production_network.ign:
	butane production_network.bu > production_network.ign

production.ign: services.ign production_network.ign
	butane -pd . production.bu > production.ign

renovate.ign:
	butane -pd services/ services/renovate.bu > services/renovate.ign

runner_x86.ign: renovate.ign
	butane -pd . runner_x86.bu > runner_x86.ign

runner_arm.ign:
	butane -pd . runner_arm.bu > runner_arm.ign

test_network.ign:
	butane test_network.bu > test_network.ign

test.ign: services.ign test_network.ign
	butane -pd . test.bu > test.ign

clean:
	rm -f *.ign **/*.ign
