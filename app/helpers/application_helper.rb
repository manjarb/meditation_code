module ApplicationHelper

  @@all_thai_cities = [
      ["Bangkok","bkk"],
      ["Amnat Charoen","acr"],
      ["Ang Thong","atg"],
      ["Bueng Kan","bkn"],
      ["Buriram","brm"],
      ["Chachoengsao","cco"],
      ["Chainat","cnt"],
      ["Chaiyaphum","cpm"],
      ["Chanthaburi","cti"],
      ["Chiang Mai","cmi"],
      ["Chiang Rai","cri"],
      ["Pattaya","cbi"],
      ["Chumphon","cpn"],
      ["Kalasin","ksn"],
      ["Kamphaeng Phet","kpt"],
      ["Kanchanaburi","kri"],
      ["Khon Kaen","kkn"],
      ["Krabi","kbi"],
      ["Lampang","lpg"],
      ["Lamphun","lpn"],
      ["Loei","lei"],
      ["Lopburi","lri"],
      ["Mae Hong Son","msn"],
      ["Maha Sarakham","mkm"],
      ["Mukdahan","mdh"],
      ["Nakhon Nayok","nyk"],
      ["Nakhon Pathom""npt"],
      ["Nakhon Phanom","npm"],
      ["Nakhon Ratchasima","nma"],
      ["Nakhon Sawan","nsn"],
      ["Nakhon Si Thammarat","nrt"],
      ["Nan","nan"],
      ["Su-ngai Kolok","nwt"],
      ["Nong Bua Lamphu","nbp"],
      ["Nong Khai","nki"],
      ["Nonthaburi","nbi"],
      ["Pathum Thani","pte"],
      ["Pattani","ptn"],
      ["Thai Mueang","pna"],
      ["Phatthalung","plg"],
      ["Phayao","pyo"],
      ["Phetchabun","pnb"],
      ["Phetchaburi","pbi"],
      ["Phichit","pct"],
      ["Phitsanulok","plk"],
      ["Phra Nakhon Si Ayutthaya","aya"],
      ["Phrae","pre"],
      ["Phuket","pkt"],
      ["Prachinburi","pri"],
      ["Hua Hin","pkn"],
      ["Ranong","rng"],
      ["Ratchaburi","rbr"],
      ["Rayong","ryg"],
      ["Roi Et","ret"],
      ["Sa Kaeo","skw"],
      ["Sakon Nakhon","snk"],
      ["Bangkok Metropolitan Area","spk"],
      ["Samut Sakhon","skn"],
      ["Samut Songkhram","skm"],
      ["Saraburi","sri"],
      ["Satun","stn"],
      ["Sing Buri","sbr"],
      ["Sisaket","ssk"],
      ["Hat Yai","ska"],
      ["Sukhothai","sti"],
      ["Suphan Buri","spb"],
      ["Surat Thani","sni"],
      ["Surin","srn"],
      ["Mae Sot","tak"],
      ["Trang","trg"],
      ["Trat","trt"],
      ["Ubon Ratchathani","ubn"],
      ["Udon Thani","udn"],
      ["Uthai Thani","uti"],
      ["Uttaradit","utd"],
      ["Yala","yla"],
      ["Yasothon","yst"]
  ]

  def countries_array_list

    return ['Thailand']

  end

  def all_countries_array_list
    all_countries = [
        "Afghanistan",
        "Aland Islands",
        "Albania",
        "Algeria",
        "American Samoa",
        "Andorra",
        "Angola",
        "Anguilla",
        "Antarctica",
        "Antigua And Barbuda",
        "Argentina",
        "Armenia",
        "Aruba",
        "Australia",
        "Austria",
        "Azerbaijan",
        "Bahamas",
        "Bahrain",
        "Bangladesh",
        "Barbados",
        "Belarus",
        "Belgium",
        "Belize",
        "Benin",
        "Bermuda",
        "Bhutan",
        "Bolivia",
        "Bosnia and Herzegowina",
        "Botswana",
        "Bouvet Island",
        "Brazil",
        "British Indian Ocean Territory",
        "Brunei Darussalam",
        "Bulgaria",
        "Burkina Faso",
        "Burundi",
        "Cambodia",
        "Cameroon",
        "Canada",
        "Cape Verde",
        "Cayman Islands",
        "Central African Republic",
        "Chad",
        "Chile",
        "China",
        "Christmas Island",
        "Cocos (Keeling) Islands",
        "Colombia",
        "Comoros",
        "Congo",
        "Congo, the Democratic Republic of the",
        "Cook Islands",
        "Costa Rica",
        "Cote d'Ivoire",
        "Croatia",
        "Cuba",
        "Cyprus",
        "Czech Republic",
        "Denmark",
        "Djibouti",
        "Dominica",
        "Dominican Republic",
        "Ecuador",
        "Egypt",
        "El Salvador",
        "Equatorial Guinea",
        "Eritrea",
        "Estonia",
        "Ethiopia",
        "Falkland Islands (Malvinas)",
        "Faroe Islands",
        "Fiji",
        "Finland",
        "France",
        "French Guiana",
        "French Polynesia",
        "French Southern Territories",
        "Gabon",
        "Gambia",
        "Georgia",
        "Germany",
        "Ghana",
        "Gibraltar",
        "Greece",
        "Greenland",
        "Grenada",
        "Guadeloupe",
        "Guam",
        "Guatemala",
        "Guernsey",
        "Guinea",
        "Guinea-Bissau",
        "Guyana",
        "Haiti",
        "Heard and McDonald Islands",
        "Holy See (Vatican City State)",
        "Honduras",
        "Hong Kong",
        "Hungary",
        "Iceland",
        "India",
        "Indonesia",
        "Iran, Islamic Republic of",
        "Iraq",
        "Ireland",
        "Isle of Man",
        "Israel",
        "Italy",
        "Jamaica",
        "Japan",
        "Jersey",
        "Jordan",
        "Kazakhstan",
        "Kenya",
        "Kiribati",
        "Korea, Democratic People's Republic of",
        "Korea, Republic of",
        "Kuwait",
        "Kyrgyzstan",
        "Lao People's Democratic Republic",
        "Latvia",
        "Lebanon",
        "Lesotho",
        "Liberia",
        "Libyan Arab Jamahiriya",
        "Liechtenstein",
        "Lithuania",
        "Luxembourg",
        "Macao",
        "Macedonia, The Former Yugoslav Republic Of",
        "Madagascar",
        "Malawi",
        "Malaysia",
        "Maldives",
        "Mali",
        "Malta",
        "Marshall Islands",
        "Martinique",
        "Mauritania",
        "Mauritius",
        "Mayotte",
        "Mexico",
        "Micronesia, Federated States of",
        "Moldova, Republic of",
        "Monaco",
        "Mongolia",
        "Montenegro",
        "Montserrat",
        "Morocco",
        "Mozambique",
        "Myanmar",
        "Namibia",
        "Nauru",
        "Nepal",
        "Netherlands",
        "Netherlands Antilles",
        "New Caledonia",
        "New Zealand",
        "Nicaragua",
        "Niger",
        "Nigeria",
        "Niue",
        "Norfolk Island",
        "Northern Mariana Islands",
        "Norway",
        "Oman",
        "Pakistan",
        "Palau",
        "Palestinian Territory, Occupied",
        "Panama",
        "Papua New Guinea",
        "Paraguay",
        "Peru",
        "Philippines",
        "Pitcairn",
        "Poland",
        "Portugal",
        "Puerto Rico",
        "Qatar",
        "Reunion",
        "Romania",
        "Russian Federation",
        "Rwanda",
        "Saint Barthelemy",
        "Saint Helena",
        "Saint Kitts and Nevis",
        "Saint Lucia",
        "Saint Pierre and Miquelon",
        "Saint Vincent and the Grenadines",
        "Samoa",
        "San Marino",
        "Sao Tome and Principe",
        "Saudi Arabia",
        "Senegal",
        "Serbia",
        "Seychelles",
        "Sierra Leone",
        "Singapore",
        "Slovakia",
        "Slovenia",
        "Solomon Islands",
        "Somalia",
        "South Africa",
        "South Georgia and the South Sandwich Islands",
        "Spain",
        "Sri Lanka",
        "Sudan",
        "Suriname",
        "Svalbard and Jan Mayen",
        "Swaziland",
        "Sweden",
        "Switzerland",
        "Syrian Arab Republic",
        "Taiwan, Province of China",
        "Tajikistan",
        "Tanzania, United Republic of",
        "Thailand",
        "Timor-Leste",
        "Togo",
        "Tokelau",
        "Tonga",
        "Trinidad and Tobago",
        "Tunisia",
        "Turkey",
        "Turkmenistan",
        "Turks and Caicos Islands",
        "Tuvalu",
        "Uganda",
        "Ukraine",
        "United Arab Emirates",
        "United Kingdom",
        "United States",
        "United States Minor Outlying Islands",
        "Uruguay",
        "Uzbekistan",
        "Vanuatu",
        "Venezuela",
        "Viet Nam",
        "Virgin Islands, British",
        "Virgin Islands, U.S.",
        "Wallis and Futuna",
        "Western Sahara",
        "Yemen",
        "Zambia",
        "Zimbabwe"
    ]

  end

  def countries_phone_code
    return ['+66','+67','+68']
  end

  def return_month_readble_format(date)
    # puts "date convertdate2"
    # puts date
    #convert_date = Date.strptime("date", '%Y-%m-%d')

    "#{(sprintf '%02d', date.day)}-#{Date::MONTHNAMES[date.month]}-#{date.year}"
  end

  def thai_city_list
    @@all_thai_cities
  end

  def return_city_by_key(city_key)
    @@all_thai_cities.each do |city|
      if city[1] == city_key
        return city[0]
      end
    end
  end

  def return_city_key_by_name(city_name)
    city_name = city_name.downcase


    puts "city_name testtt"
    puts city_name

    #byebug

    # @@all_thai_cities.each do |city|
    #   if city[0] == city_name
    #     puts "MatchMatchMatchMatchMatchMatchMatch"
    #     return city[1]
    #   else
    #     puts "No match"
    #   end
    # end

    for i in 0..@@all_thai_cities.count() - 1
      if @@all_thai_cities[i][0].downcase == city_name
        return @@all_thai_cities[i][1]
      end
    end

    return nil

  end

  def returnRatingCounter(rating)
    (rating / 2).ceil
  end

  def return_username_by_id(user_id)
    "wating for user model"
  end

  def return_review_level_text(review_score)
    if review_score >= 9
      "Superb"
    elsif review_score >= 8
      "Very Good"
    elsif review_score >= 7
      "Good"
    elsif review_score >= 6
      "Pleasant"
    elsif review_score >= 5
      "Normal"
    else
      "Poor"
    end
  end

  def price_show_func(activity)
    if activity.payment_need == true
      unless activity.payment_price.nil?
        if activity.payment_price > 0 || activity.payment_price != ""
          return number_with_delimiter(activity.payment_price)+ " " + CGI.unescapeHTML("&#3647;")
        else
          "Free"
        end
      else
        "Free"
      end
    else
      "Free"
    end
  end

  def return_all_activities_by_order
    if params.has_key?(:orderby)
      order_met = params[:orderby]

      if order_met == "rankhigh"
        puts "RANK HIGhhhhhh"
        Activity.all.order(rating: :desc)
      elsif order_met == "ranklow"
        puts "RANK HIGlllllllll"
        Activity.all.order(rating: :asc)
      else
        puts "NOOOOO RANK"
        Activity.all.order(created_at: :desc)
      end

    else
      puts "NOOOOO RANK"
      Activity.all.order(created_at: :desc)
    end
  end

  def return_city_by_activity(temple_id)
    temple = Temple.find_by(id: temple_id)
    return temple.city
  end

  def return_html_paragraph(html)
    CGI.unescapeHTML(html)
  end

  def return_tags_list(blog)

    tags = blog.tags

  end

end
