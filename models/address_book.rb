require_relative 'entry'

class AddressBook
    attr_accessor :entries

    def initialize
        @entries = []
    end

    def add_entry(name, phone_number, email)
=begin
        if address_book.entries.include?([name, phone_number, email])
            puts "hello"
            return
        end
=end
        index = 0
        entries.each do |entry|
            if name < entry.name
                break
            elsif name == entry.name
                if phone_number == entry.phone_number && email == entry.email
                    return nil
                end
            end
            index += 1
        end
        entries.insert(index, Entry.new(name, phone_number, email))
    end

    def remove_entry(name, phone_number, email)
        index = 0
        entries.each do |entry|
            if entry.name === name && entry.phone_number === phone_number && entry.email === email
                removed_entry = entries.delete(entry)
                return removed_entry
            end
            if name > entry.name
                return nil
            end
        end
        nil
    end
end
