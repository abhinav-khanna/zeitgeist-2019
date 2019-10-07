class SampleEvent{
  final String name,start_date_time,description;

  SampleEvent(this.name,this.start_date_time,this.description);
}

class Event{
  final String name,start_date_time,event_type,end_date_time,description, link_to_rulebook, venue;
  final int id,first_cash_prize,second_cash_prize,third_cash_prize,first_goodies,second_goodies,third_goodies
  ,minimum_team_size,maximum_team_size,subcategory;


  Event(this.name,this.start_date_time,this.event_type,this.end_date_time,this.description,this.subcategory,
      this.id,this.first_cash_prize,this.second_cash_prize,this.third_cash_prize,this.first_goodies,this.second_goodies,this.third_goodies
      ,this.minimum_team_size,this.maximum_team_size, this.link_to_rulebook, this.venue);

}
