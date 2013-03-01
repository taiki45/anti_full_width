# -*- coding: utf-8 -*-

Plugin.create :anti_full_width do
  halfs = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a
  fulls = ('０'..'９').to_a + ('Ａ'..'Ｚ').to_a + ('ａ'..'ｚ').to_a
  table = Hash[fulls.zip(halfs)]

  filter_show_filter do |msgs|
    [
      msgs.map do |m|
        m[:message] = m[:message].gsub(/[０-９][Ａ-ｚ]/u, table)
        m
      end
    ]
  end
end
