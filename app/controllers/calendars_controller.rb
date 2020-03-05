require 'icalendar'
require 'date'

class CalendarsController < ApplicationController
  def generate
    cal = Icalendar::Calendar.new
    filename = "#{params[:type]} avec #{params[:name_user]}"

    if params[:format] == 'vcs'
      cal.prodid = '-//Microsoft Corporation//Outlook MIMEDIR//EN'
      cal.version = '1.0'
      filename += '.vcs'
    else # ical
      cal.prodid = '-//Acme Widgets, Inc.//NONSGML ExportToCalendar//EN'
      cal.version = '2.0'
      filename += '.ics'
    end
    start_time = DateTime.new(2020,3,7,17)
    end_time =DateTime.new(2020,3,7,18)


    cal.event do |e|
      e.dtstart     = Icalendar::Values::DateTime.new(start_time)
      e.dtend       = Icalendar::Values::DateTime.new(end_time)
      e.summary     = "#{params[:type]} avec #{params[:name_user]}"
      e.description = "Lieu du rendez-vous : #{params[:name_place]}. Une super aprem en perspective avec #{params[:name_user]}"
      e.location    = "#{params[:address]}"
    end

    send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: filename
  end
end
