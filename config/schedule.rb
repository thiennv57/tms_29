every 1.month, at: "end of the month at 00:00am" do
  runner "Course.send_courses_info_to_supervisor"
end
