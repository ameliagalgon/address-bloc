require_relative '../models/address_book'

RSpec.describe AddressBook do
    describe "attributes" do
        it "responds to entries" do
            book = AddressBook.new
            expect(book).to respond_to(:entries)
        end

        it "initializes entries as an array" do
            book = AddressBook.new
            expect(book.entries).to be_an(Array)
        end

        it "initializes entries as empty" do
            book = AddressBook.new
            expect(book.entries.size).to eq(0)
        end
    end

    describe "#add_entry" do
        it "adds only one entry to the address book" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect(book.entries.size).to eq(1)
        end

        it "adds the correct information to entries" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            new_entry = book.entries[0]

            expect(new_entry.name).to eq('Ada Lovelace')
            expect(new_entry.phone_number).to eq('010.012.1815')
            expect(new_entry.email).to eq('augusta.king@lovelace.com')
        end

        it "does not add duplicate entries" do
            book.AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

            expect(book.entries.size).to eq(1)
        end
    end

    describe "#remove_entry" do
        it "removes a single entry" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            old_size = book.entries.size
            book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

            expect(book.entries.size).to eq(old_size - 1)
        end

        it "removes the correct entry" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            removed_entry = book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

            expect(removed_entry.name).to eq('Ada Lovelace')
            expect(removed_entry.phone_number).to eq('010.012.1815')
            expect(removed_entry.email).to eq('augusta.king@lovelace.com')
        end

        it "doesn't remove a non-existant entry" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            removed_entry = book.remove_entry('John Smith', '010.634.5789', 'john.smith@server.com')

            expect(removed_entry).to eq(nil)
        end
=begin
        it "raise an error if the improper number of arguments are used" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            expect{book.remove_entry('Ada Lovelace')}.to raise_error(ArgumentError)
        end

        it "will remove one entry if there are duplicates" do
            book = AddressBook.new
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
            old_size = book.entries.size
            removed_entry = book.remove_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')

            expect(book.entries.size).to eq(old_size - 1)
        end
=end
    end
end
