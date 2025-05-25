all: config.ign

network.ign:
	butane ./network.bu > network.ign

opengist.ign:
	butane ./opengist.bu > opengist.ign

nextcloud.ign:
	butane ./nextcloud.bu > nextcloud.ign

sludgebin.ign:
	butane ./sludgebin.bu > sludgebin.ign

forgejo.ign:
	butane ./forgejo.bu > forgejo.ign

config.ign: nextcloud.ign sludgebin.ign opengist.ign forgejo.ign
	butane -pd . ./config.bu > config.ign

test_config.ign: config.ign network.ign
	butane -pd . ./test_config.bu > test_config.ign

clean:
	rm -f config.ign nextcloud.ign sludgebin.ign network.ign \
		opengist.ign forgejo.ign test_config.ign
