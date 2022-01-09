module ReportlistHelper
    def end_of_day
        change(hour: 23, min: 59, sec: 59, usec: Rational(999999999, 1000))
    end
end
