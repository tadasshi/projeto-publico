xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title 'Mastering PNL - RSS'
    xml.description 'Feed description'
    xml.link root_url
    xml.language 'pt-br'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url

    for bibliographies in @bibliographies
      xml.item do
        xml.title bibliographies.title
        xml.link bibliographies_url(bibliographies)
        xml.pubDate(bibliographies.created_at.rfc2822)
        xml.guid bibliographies.id
        xml.description(h(bibliographies.description))
      end
    end

    for ebooks in @ebooks
      xml.item do
        xml.title ebooks.title
        xml.link bibliographies_url(ebooks)
        xml.pubDate(ebooks.created_at.rfc2822)
        xml.guid ebooks.id
        xml.description(h(ebooks.description))
      end
    end

    for metaphors in @metaphors
      xml.item do
        xml.title metaphors.title
        xml.link bibliographies_url(metaphors)
        xml.pubDate(metaphors.created_at.rfc2822)
        xml.guid metaphors.id
        xml.description(h(metaphors.description))
      end
    end

  end

end