DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'EmojiType') THEN
        CREATE TYPE "EmojiType" as enum ('normal', 'custom');
    END IF;
END$$;

CREATE TABLE IF NOT EXISTS guilds (
	id BIGINT NOT NULL,
	prefix VARCHAR(16) NOT NULL,
)

CREATE TABLE IF NOT EXISTS giveaways (
	id SERIAL NOT NULL,

	guild_id BIGINT NOT NULL,
	channel_id BIGINT NOT NULL,
	message_id BIGINT NOT NULL,

	emoji VARCHAR(32) NOT NULL,
	emoji_type "EmojiType",

	created_at NOT NULL TIMESTAMP DEFAULT NOW()
)