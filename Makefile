all: services.ign

opengist.ign:
	butane services/opengist.bu > services/opengist.ign

nextcloud.ign:
	butane services/nextcloud.bu > services/nextcloud.ign

sludgebin.ign:
	butane services/sludgebin.bu > services/sludgebin.ign

forgejo.ign:
	butane services/forgejo.bu > services/forgejo.ign

vaultwarden.ign:
	butane services/vaultwarden.bu > services/vaultwarden.ign

services.ign: opengist.ign nextcloud.ign sludgebin.ign forgejo.ign vaultwarden.ign
	butane -pd services/ services/services.bu > services/services.ign

production_network.ign:
	butane production_network.bu > production_network.ign

production.ign: services.ign production_network.ign
	butane -pd . production.bu > production.ign

runner.ign:
	butane runner.bu > runner.ign

test_network.ign:
	butane test_network.bu > test_network.ign

test.ign: services.ign test_network.ign
	butane -pd . test.bu > test.ign

clean:
	rm -f *.ign **/*.ign
