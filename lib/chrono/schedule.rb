module Chrono
  class Schedule
    attr_reader :source

    def initialize(source)
      unless %r<\A[ \t]*(?:(?<field>\S+)[ \t]+){4}\g<field>[ \t]*\z> =~ source
        raise Chrono::Fields::Base::InvalidField.new('invalid source', source)
      end
      @source = source
    end

    def minutes
      Fields::Minute.new(fields[0]).to_a
    end

    def hours
      Fields::Hour.new(fields[1]).to_a
    end

    def days
      Fields::Day.new(fields[2]).to_a
    end

    def months
      Fields::Month.new(fields[3]).to_a
    end

    def wdays
      Fields::Wday.new(fields[4]).to_a
    end

    private

    def fields
      @fields ||= source.split(" ")
    end
  end
end
