all: feed sync

feed:
	cat rss_header.xml > feed.xml
	for ep in $$(ls -t episodes/|head -10); do \
		cat episodes/$$ep/item.xml >> feed.xml; \
	done
	echo "\n</channel>\n</rss>" >> feed.xml

sync:
	aws s3 cp feed.xml s3://security-bytes-podcast/ \
		--content-type "application/rss+xml; charset=UTF-8" \
		--acl public-read
	aws s3 sync . s3://security-bytes-podcast \
		--exclude "*" \
		--include "*.mp3" \
		--content-type "audio/mpeg" --acl public-read
