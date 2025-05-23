all: config.ign

nextcloud.ign:
	butane ./nextcloud.bu > nextcloud.ign

config.ign: nextcloud.ign
	butane -pd . ./config.bu > config.ign

clean:
	rm -f config.ign nextcloud.ign
