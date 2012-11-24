module Helpers

  def fixture_file filename
    file = Rails.root.join('spec', 'fixtures', filename)
    raise "the fixture file does not exists" unless file.exist?
    file.open
  end

end

