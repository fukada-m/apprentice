def file_read
    File.open('./ruby/sql/create_table.sql', 'r') do |f|
        p f.read
    end
end
