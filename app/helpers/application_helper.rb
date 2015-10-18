module ApplicationHelper

  def perex(text, count = 50)
    text.split[0..count].join
  end
end
