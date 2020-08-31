
class Pagination {

  bool needed;
  int count;
  int page;
  int lastpage;
  int limit;

	Pagination.fromJsonMap(Map<String, dynamic> map): 
		needed = map["needed"],
		count = map["count"],
		page = map["page"],
		lastpage = map["lastpage"],
		limit = map["limit"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['needed'] = needed;
		data['count'] = count;
		data['page'] = page;
		data['lastpage'] = lastpage;
		data['limit'] = limit;
		return data;
	}

	@override
	String toString() {
		return 'Pagination{\n\t\t\tneeded: $needed\n\t\t\tcount: $count\n\t\t\tpage: $page\n\t\t\tlastpage: $lastpage\n\t\t\tlimit: $limit\n}';
	}


}
