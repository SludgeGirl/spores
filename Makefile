all: config.ign

opengist.ign:
	butane ./opengist.bu > opengist.ign

nextcloud.ign:
	butane ./nextcloud.bu > nextcloud.ign

sludgebin.ign:
	butane ./sludgebin.bu > sludgebin.ign

forgejo.ign:
	butane ./forgejo.bu > forgejo.ign

vaultwarden.ign:
	butane ./vaultwarden.bu > vaultwarden.ign

config.ign: nextcloud.ign sludgebin.ign opengist.ign forgejo.ign vaultwarden.ign
	butane -pd . ./config.bu > config.ign

deploy_network.ign:
	butane ./deploy_network.bu > deploy_network.ign

deploy_config.ign: config.ign deploy_network.ign
	butane -pd . ./deploy_config.bu > deploy_config.ign

test_network.ign:
	butane ./test_network.bu > test_network.ign

test_config.ign: config.ign test_network.ign
	butane -pd . ./test_config.bu > test_config.ign

clean:
	rm -f config.ign nextcloud.ign sludgebin.ign \
		opengist.ign forgejo.ign test_config.ign \
		vaultwarden.ign \
		deploy_network.ign test_network.ign
