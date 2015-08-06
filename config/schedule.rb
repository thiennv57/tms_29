
every 1.minutes do
  runner "Course.daily_report_infomation", environment: "development"
end

every "59 23 28-31 * * [ &quot;$(date +%d -d tomorrow)&quot; = &quot;01&quot; ] &amp;&amp" do
  runner "User.monthly_report"
end

