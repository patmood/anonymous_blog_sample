def parser(paragraph)
  string_builder = ""
  string_array = paragraph.split('')

  string_array.each do |word|
    if word == "\n"
      string_builder << "<br>"
    else
      string_builder << word
    end
  end

  string_builder
end

def convert_tags_to_array(tag_string)
  cleaned_tags = []
  tags = tag_string.split(',')
  tags.map!{|tag_word| tag_word.strip}
  
  tags.each do |tag|
    cleaned_tags << Tag.find_or_create_by_name(tag)
  end

  cleaned_tags
end
