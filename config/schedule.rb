every 1.minutes do
  runner "Course.daily_report_infomation", environment: "development"
end
