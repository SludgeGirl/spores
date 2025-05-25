all: config.ign

network.ign:
	butane ./network.bu > network.ign

opengist.ign:
	butane ./opengist.bu > opengist.ign

nextcloud.ign:
	butane ./nextcloud.bu > nextcloud.ign

sludgebin.ign:
	butane ./sludgebin.bu > sludgebin.ign

config.ign: nextcloud.ign sludgebin.ign network.ign opengist.ign
	butane -pd . ./config.bu > config.ign

clean:
	rm -f config.ign nextcloud.ign sludgebin.ign network.ign \
		opengist.ign
