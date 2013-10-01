xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Calvary Chapel Mercer County"
    xml.description "Calvary Chapel Mercer County"
    xml.link sermons_url
    xml.tag! "itunes:category", "Christianity"
    xml.tag! "items:subtitle", "Welcome to the Calvary Chapel Mercer County(CCMC) Audio Podcast. CCMC teaches through
the Bible verse-by-verse.  CCMC is located in Ewing, New Jersey. "
    xml.tag! "itunes:summary", "Welcome to the Calvary Chapel Mercer County(CCMC) Audio Podcast. CCMC teaches through
the Bible verse-by-verse.  CCMC is located in Ewing, New Jersey. "
    xml.tag! "itunes:author", "Calvary Chapel Mercer County"
    xml.tag!  "itunes:owner" do
       xml.tag! "itunes:name", ""
       xml.tag! "itunes:email", ""
    end
    xml.tag! "itunes:image", ""
    xml.tag! "itunes:explicit", "no"

    for post in @sermons
      xml.item do
        xml.title post.title
        xml.description post.description
        xml.pubDate post.publish_date
        xml.book post.book_id
        xml.speaker post.speaker.name
        xml.link sermon_url(post)
        xml.guid sermon_url(post)
        xml.tag! "itunes:author", post.speaker.name
        xml.tag! "itunes:summary", post.description
        xml.tag! "itunes:subtitle", post.title
        xml.tag! "itunes:duration", "60"
        xml.tag! "itunes:keywords", post.keywords


      end
    end
  end
end