# Mozilla Security Bytes podcast

Public feed: https://d1driw5hlgyml1.cloudfront.net/feed.xml

This repository contains the files used to publish the SecBytes podcast to S3.
Each episode is posted in its own folder, numbered by episode, and a global
`feed.xml` file is created to tell iTunes how to retrieve them.

The add a new podcast:

1. create a new directory under `episodes/<podcast number>`

2. place the mp3 file of the episode in that directory, avoid file names that
   require URL encoding for simplicity

3. create an `item.xml` file in that directory

```xml
<item>
    <title>TITLE OF THE EPISODE</title>
    <itunes:author>LIST OF PARTICIPANTS</itunes:author>
    <itunes:subtitle>A SUBTITLE FOR THE EPISODE</itunes:subtitle>
    <itunes:summary>A DESCRIPTION OF THE CONTENTS OF YOUR EPISODE</itunes:summary>
    <enclosure url="https://d1driw5hlgyml1.cloudfront.net/episodes/NUMBER/FILENAME.mp3" length="FILE SIZE IN BYTES" type="audio/mpeg" />
    <guid>https://d1driw5hlgyml1.cloudfront.net/episodes/NUMBER/FILENAME.mp3</guid>
    <pubDate>DATE, E.G. Wed, 15 Jan 2017 19:00:00 GMT</pubDate>
    <itunes:duration>DURATION H:MM:SS</itunes:duration>
    <itunes:explicit>no</itunes:explicit>
</item>
```

4. from the top-level dir, call `make feed` to create `feed.xml`, your new
   episode should appear as the first item in the list of items. You can
   validate the XML format using tools like `xmllint` or
   http://xmlbeautifier.com/

5. submit a pull request for review and the new feed and files will be
   automatically uploaded when the PR is merged into master.
