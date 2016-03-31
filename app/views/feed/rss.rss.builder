xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title 'Mastering PNL - RSS'
    xml.description 'Feed description'
    xml.link root_url
    xml.language 'pt-br'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url

    for bibliography in @bibliographies
      xml.item do
        xml.title bibliography.title
        xml.link bibliography_url(bibliography)
        xml.pubDate(bibliography.created_at.rfc2822)
        xml.guid bibliography.id
        xml.description(h(bibliography.description))
      end
    end

    for ebook in @ebooks
      xml.item do
        xml.title ebook.title
        xml.link ebook_url(ebook)
        xml.pubDate(ebook.created_at.rfc2822)
        xml.guid ebook.id
        xml.description(h(ebook.description))
      end
    end

    for metaphor in @metaphors
      xml.item do
        xml.title metaphor.title
        xml.link metaphor_url(metaphor)
        xml.pubDate(metaphor.created_at.rfc2822)
        xml.guid metaphor.id
        xml.description(h(metaphor.description))
      end
    end

    for post in @posts
      xml.item do
        xml.title post.title
        xml.link post_url(post)
        xml.pubDate(post.created_at.rfc2822)
        xml.guid post.id
        xml.description(h(post.description))
      end
    end

    for biography in @biographies

      xml.item do
        xml.title biography.title
        xml.link biography_url(biography)
        xml.pubDate(biography.created_at.rfc2822)
        xml.guid biography.id
        xml.description(h(biography.description))
      end
    end

  end

end