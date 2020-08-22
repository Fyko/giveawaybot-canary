-- Add migration script here
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'EmojiType') THEN
        CREATE TYPE "EmojiType" AS ENUM ('normal', 'custom');
    END IF;
END$$;

CREATE TABLE IF NOT EXISTS entries (
	id SERIAL NOT NULL,
	user_id BIGINT NOT NULL,
	message_id BIGINT NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS giveaways (
	id SERIAL NOT NULL,
	guild_id BIGINT NOT NULL,
	channel_id BIGINT NOT NULL,
	message_id BIGINT NOT NULL,
	emoji VARCHAR(32) NOT NULL,
	emoji_type "EmojiType" NOT NULL,
	winners INTEGER NOT NULL,
	draw_at TIMESTAMPTZ NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS guilds (
	id BIGINT NOT NULL,
	prefix VARCHAR(16) NOT NULL,
	created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

