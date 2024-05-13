--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Debian 15.7-1.pgdg120+1)
-- Dumped by pg_dump version 15.4

-- Started on 2024-05-13 12:19:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: surveys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surveys (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying,
    json json
);


ALTER TABLE public.surveys OWNER TO postgres;

--
-- TOC entry 3354 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: surveys; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.surveys VALUES ('5d6326c6-f7d1-41a9-b0fc-8ed2dcc9aeb0', 'Product Feedback Survey', '{
    "pages": [{
      "elements": [{
        "type": "matrix",
        "name": "Quality",
        "title": "Please indicate if you agree or disagree with the following statements",
        "columns": [{
          "value": 1,
          "text": "Strongly disagree"
        }, {
          "value": 2,
          "text": "Disagree"
        }, {
          "value": 3,
          "text": "Neutral"
        }, {
          "value": 4,
          "text": "Agree"
        }, {
          "value": 5,
          "text": "Strongly agree"
        }],
        "rows": [{
          "value": "affordable",
          "text": "Product is affordable"
        }, {
          "value": "does what it claims",
          "text": "Product does what it claims"
        }, {
          "value": "better then others",
          "text": "Product is better than other products on the market"
        }, {
          "value": "easy to use",
          "text": "Product is easy to use"
        }]
      }, {
        "type": "rating",
        "name": "satisfaction",
        "title": "How satisfied are you with the product?",
        "mininumRateDescription": "Not satisfied",
        "maximumRateDescription": "Completely satisfied"
      }, {
        "type": "rating",
        "name": "recommend friends",
        "visibleIf": "{satisfaction} > 3",
        "title": "How likely are you to recommend the product to a friend or colleague?",
        "mininumRateDescription": "Won''t recommend",
        "maximumRateDescription": "Will recommend"
      }, {
        "type": "comment",
        "name": "suggestions",
        "title": "What would make you more satisfied with the product?"
      }]
    }, {
      "elements": [{
        "type": "radiogroup",
        "name": "price to competitors",
        "title": "Compared to our competitors, do you feel the product is",
        "choices": [
          "Less expensive",
          "Priced about the same",
          "More expensive",
          "Not sure"
        ]
      }, {
        "type": "radiogroup",
        "name": "price",
        "title": "Do you feel our current price is merited by our product?",
        "choices": [
          "correct|Yes, the price is about right",
          "low|No, the price is too low",
          "high|No, the price is too high"
        ]
      }, {
        "type": "multipletext",
        "name": "pricelimit",
        "title": "What is the... ",
        "items": [{
          "name": "mostamount",
          "title": "Most amount you would pay for a product like ours"
        }, {
          "name": "leastamount",
          "title": "The least amount you would feel comfortable paying"
        }]
      }]
    }, {
      "elements": [{
        "type": "text",
        "name": "email",
        "title": "Thank you for taking our survey. Please enter your email address and press the ''Submit'' button."
      }]
    }]
  }');
INSERT INTO public.surveys VALUES ('b5b65347-2b31-4693-b7bf-2908cc503be5', 'Customer and their partner income survey', '{
    "completeText": "Finish",
    "pageNextText": "Continue",
    "pagePrevText": "Previous",
    "pages": [{
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "html",
          "name": "income_intro",
          "html":
            "Income. In this section, you will be asked about your current employment status and other ways you and your partner receive income. It will be handy to have the following in front of you: payslip (for employment details), latest statement from any payments (from Centrelink or other authority), a current Centrelink Schedule for any account-based pension from super, annuities, or other income stream products that you may own. If you don''t have a current one, you can get these schedules by contacting your income stream provider."
        }],
        "name": "panel1"
      }],
      "name": "page0"
    }, {
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "radiogroup",
          "choices": [
            "Married",
            "In a registered relationship",
            "Living with my partner",
            "Widowed",
            "Single"
          ],
          "name": "maritalstatus_c",
          "title": " "
        }],
        "name": "panel13",
        "title": "What is your marital status?"
      }],
      "name": "page1"
    }, {
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "panel",
          "elements": [{
            "type": "radiogroup",
            "choices": [{
              "value": "1",
              "text": "Yes"
            }, {
              "value": "0",
              "text": "No"
            }],
            "colCount": 2,
            "isRequired": true,
            "name": "member_receives_income_from_employment",
            "title": " "
          }, {
            "type": "checkbox",
            "name": "member_type_of_employment",
            "visible": false,
            "visibleIf": "{member_receives_income_from_employment} =1",
            "title": "  ",
            "isRequired": true,
            "choices": [
              "Self-employed",
              "Other types of employment"
            ]
          }],
          "name": "panel2",
          "title": "You"
        }, {
          "type": "panel",
          "elements": [{
            "type": "radiogroup",
            "choices": [{
              "value": "1",
              "text": "Yes"
            }, {
              "value": "0",
              "text": "No"
            }],
            "colCount": 2,
            "isRequired": true,
            "name": "partner_receives_income_from_employment",
            "title": " "
          }, {
            "type": "checkbox",
            "name": "partner_type_of_employment",
            "visible": false,
            "visibleIf": "{partner_receives_income_from_employment} =1",
            "title": " ",
            "isRequired": true,
            "choices": [
              "Self-employed",
              "Other types of employment"
            ]
          }],
          "name": "panel1",
          "startWithNewLine": false,
          "title": "Your Partner",
          "visibleIf":
            "{maritalstatus_c} = ''Married'' or {maritalstatus_c} = ''In a registered relationship'' or {maritalstatus_c} = ''Living with my partner''"
        }],
        "name": "panel5",
        "title": "Do you and/or your partner currently receive income from employment?"
      }],
      "name": "page2"
    }, {
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "panel",
          "elements": [{
            "type": "paneldynamic",
            "minPanelCount": 1,
            "name": "member_array_employer_names",
            "valueName": "member_array_employer",
            "title": "Enter information about your employers",
            "panelAddText": "Add another employer",
            "panelCount": 1,
            "templateElements": [{
              "type": "text",
              "name": "member_employer_name",
              "valueName": "name",
              "title": "Employer name"
            }]
          }],
          "name": "panel2",
          "title": "You",
          "visible": false,
          "visibleIf": "{member_type_of_employment} contains ''Other types of employment''"
        }, {
          "type": "panel",
          "elements": [{
            "type": "paneldynamic",
            "minPanelCount": 1,
            "name": "partner_array_employer_names",
            "valueName": "partner_array_employer",
            "title": "Enter information about employers of your partner",
            "panelAddText": "Add another employer",
            "panelCount": 1,
            "templateElements": [{
              "type": "text",
              "name": "partner_employer_name",
              "valueName": "name",
              "title": "Employer name"
            }]
          }],
          "name": "panel8",
          "startWithNewLine": false,
          "title": "Your Partner",
          "visible": false,
          "visibleIf":
            "{partner_type_of_employment} contains ''Other types of employment''"
        }],
        "name": "panel6",
        "title": "Employers"
      }],
      "name": "page3.1",
      "visible": false,
      "visibleIf":
        "{member_type_of_employment} contains ''Other types of employment'' or {partner_type_of_employment} contains ''Other types of employment''"
    }, {
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "panel",
          "elements": [{
            "type": "paneldynamic",
            "renderMode": "progressTop",
            "allowAddPanel": false,
            "allowRemovePanel": false,
            "name": "member_array_employer_info",
            "title": "Your employers",
            "valueName": "member_array_employer",
            "panelCount": 1,
            "templateElements": [{
              "type": "panel",
              "name": "panel_member_employer_address",
              "title": "Contacts",
              "elements": [{
                "type": "text",
                "name": "member_employer_address",
                "valueName": "address",
                "title": "Address:"
              }, {
                "type": "text",
                "name": "member_employer_phone",
                "valueName": "phone",
                "title": "Phone number:"
              }, {
                "type": "text",
                "name": "member_employer_abn",
                "valueName": "abn",
                "title": "ABN:"
              }]
            }, {
              "type": "panel",
              "name": "panel_member_employer_role",
              "title": "Are you a full time worker?",
              "elements": [{
                "type": "radiogroup",
                "choices": [
                  "Full-time",
                  "Part-time",
                  "Casual",
                  "Seasonal"
                ],
                "name": "member_employer_role",
                "title": " ",
                "valueName": "role"
              }]
            }, {
              "type": "panel",
              "name": "panel_member_employer_hours_work",
              "title": "How many hours do you work?",
              "elements": [{
                "type": "text",
                "inputType": "number",
                "name": "member_employer_hours_worked",
                "valueName": "hours_worked",
                "title": "Hours:"
              }, {
                "type": "dropdown",
                "name": "member_employer_hours_worked_frequency",
                "title": "Work frequency:",
                "valueName": "hours_worked_frequency",
                "startWithNewLine": false,
                "defaultValue": "Day",
                "choices": [
                  "Day",
                  "Week",
                  "Fortnight",
                  "Month",
                  "Year"
                ]
              }]
            }, {
              "type": "panel",
              "name": "panel_member_employer_income",
              "title": "What is your income?",
              "elements": [{
                "type": "text",
                "inputType": "number",
                "name": "member_employer_income",
                "valueName": "income",
                "title": "Income:"
              }, {
                "type": "dropdown",
                "name": "member_employer_income_frequency",
                "title": "Income frequency:",
                "valueName": "income_frequency",
                "startWithNewLine": false,
                "defaultValue": "Month",
                "choices": [
                  "Day",
                  "Week",
                  "Fortnight",
                  "Month",
                  "Year"
                ]
              }]
            }],
          "templateTitle": "Employer name: {panel.name}"
        }],
        "name": "panel17",
        "title": "You",
        "visibleIf": "{member_type_of_employment} contains ''Other types of employment''"
      }, {
        "type": "panel",
        "elements": [{
          "type": "paneldynamic",
          "renderMode": "progressTop",
          "allowAddPanel": false,
          "allowRemovePanel": false,
          "name": "partner_array_employer_info",
          "title": "Employers",
          "valueName": "partner_array_employer",
          "panelCount": 1,
          "templateElements": [{
            "type": "panel",
            "name": "panel_partner_employer_address",
            "title": "Contacts",
            "elements": [{
              "type": "text",
              "name": "partner_employer_address",
              "valueName": "address",
              "title": "Address:"
            }, {
              "type": "text",
              "name": "partner_employer_phone",
              "valueName": "phone",
              "title": "Phone number:"
            }, {
              "type": "text",
              "name": "partner_employer_abn",
              "valueName": "abn",
              "title": "ABN:"
            }]
          }, {
            "type": "panel",
            "name": "panel_partner_employer_role",
            "title": "Are you a full time worker?",
            "elements": [{
              "type": "radiogroup",
              "choices": [
                "Full-time",
                "Part-time",
                "Casual",
                "Seasonal"
              ],
              "name": "partner_employer_role",
              "title": "Your role",
              "valueName": "role"
            }]
          }, {
            "type": "panel",
            "name": "panel_partner_employer_hours_work",
            "title": "How many hours do you work?",
            "elements": [{
              "type": "text",
              "inputType": "number",
              "name": "partner_employer_hours_worked",
              "valueName": "hours_worked",
              "title": "Hours:"
            }, {
              "type": "dropdown",
              "name": "partner_employer_hours_worked_frequency",
              "valueName": "hours_worked_frequency",
              "title": "Work frequency:",
              "startWithNewLine": false,
              "defaultValue": "Day",
              "choices": [
                "Day",
                "Week",
                "Fortnight",
                "Month",
                "Year"
              ]
            }]
          }, {
            "type": "panel",
            "name": "panel_partner_employer_income",
            "title": "What is your income?",
            "elements": [{
              "type": "text",
              "inputType": "number",
              "name": "partner_employer_income",
              "valueName": "income",
              "title": "Income:"
            }, {
              "type": "dropdown",
              "name": "partner_employer_income_frequency",
              "valueName": "income_frequency",
              "title": "Income frequency:",
              "startWithNewLine": false,
              "defaultValue": "Month",
              "choices": [
                "Day",
                "Week",
                "Fortnight",
                "Month",
                "Year"
              ]
            }]
          }],
          "templateTitle": "Employer name: {panel.name}"
        }],
        "name": "panel18",
        "startWithNewLine": false,
        "title": "You partner",
        "visibleIf": "{partner_type_of_employment} contains ''Other types of employment''"
      }],
      "name": "panel16",
      "title": "Enter information about your employers"
    }],
    "name": "page3.2",
    "visibleIf":
      "{member_type_of_employment} contains ''Other types of employment'' or {partner_type_of_employment} contains ''Other types of employment''"
  }, {
    "elements": [{
      "type": "panel",
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "radiogroup",
          "choices": [{
            "value": "1",
            "text": "Yes"
          }, {
            "value": "0",
            "text": "No"
          }],
          "colCount": 2,
          "isRequired": true,
          "name": "member_receive_fringe_benefits",
          "title": " "
        }, {
          "type": "panel",
          "elements": [{
            "type": "text",
            "name": "member_fringe_benefits_type"
          }, {
            "type": "text",
            "name": "member_fringe_benefits_value"
          }, {
            "type": "radiogroup",
            "choices": ["Grossed up", "Not grossed up"],
            "name": "member_fringe_benefits_grossing"
          }],
          "name": "panel11",
          "visible": false,
          "visibleIf": "{member_receive_fringe_benefits} = 1"
        }],
        "name": "panel2",
        "title": "You",
        "visible": false,
        "visibleIf": "{member_type_of_employment} contains ''Other types of employment''"
      }, {
        "type": "panel",
        "elements": [{
          "type": "radiogroup",
          "choices": [{
            "value": "1",
            "text": "Yes"
          }, {
            "value": "0",
            "text": "No"
          }],
          "colCount": 2,
          "isRequired": true,
          "name": "partner_receive_fringe_benefits",
          "title": " "
        }, {
          "type": "panel",
          "elements": [{
            "type": "text",
            "name": "partner_fringe_benefits_type"
          }, {
            "type": "text",
            "name": "partner_fringe_benefits_value"
          }, {
            "type": "radiogroup",
            "choices": ["Grossed up", "Not grossed up"],
            "name": "partner_fringe_benefits_grossing"
          }],
          "name": "panel12",
          "visible": false,
          "visibleIf": "{partner_receive_fringe_benefits} = 1"
        }],
        "name": "panel1",
        "startWithNewLine": false,
        "title": "Your Partner",
        "visible": false,
        "visibleIf": "{partner_type_of_employment} contains ''Other types of employment''"
      }],
      "name": "panel9",
      "title": "Do any of your employers provide you with fringe benefits?"
    }],
      "name": "page4",
      "visible": false,
      "visibleIf":
        "{member_type_of_employment} contains ''Other types of employment'' or {partner_type_of_employment} contains ''Other types of employment''"
    }, {
      "elements": [{
        "type": "panel",
        "elements": [{
          "type": "panel",
          "elements": [{
            "type": "radiogroup",
            "choices": [{
              "value": "1",
              "text": "Yes"
            }, {
              "value": "0",
              "text": "No"
            }],
            "colCount": 2,
            "isRequired": true,
            "name": "member_seasonal_intermittent_or_contract_work",
            "title": " "
          }],
          "name": "panel2",
          "title": "You",
          "visible": false,
          "visibleIf": "{member_receives_income_from_employment} = 1"
        }, {
          "type": "panel",
          "elements": [{
            "type": "radiogroup",
            "choices": [{
              "value": "1",
              "text": "Yes"
            }, {
              "value": "0",
              "text": "No"
            }],
            "colCount": 2,
            "isRequired": true,
            "name": "partner_seasonal_intermittent_or_contract_work",
            "title": " "
          }],
          "name": "panel1",
          "startWithNewLine": false,
          "title": "Your Partner",
          "visible": false,
          "visibleIf": "{partner_receives_income_from_employment} =1 "
        }],
        "name": "panel10",
        "title": "In the last 6 months, have you done any seasonal, intermittent or contract work?"
      }],
      "name": "page5",
      "visible": false,
      "visibleIf": "{member_receives_income_from_employment} = 1 or {partner_receives_income_from_employment} =1 "
    }],
    "requiredText": "",
    "showQuestionNumbers": "off",
    "storeOthersAsComment": false
  }');


--
-- TOC entry 3211 (class 2606 OID 16406)
-- Name: surveys surveys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveys
    ADD CONSTRAINT surveys_pkey PRIMARY KEY (id);


-- Completed on 2024-05-13 12:19:43

--
-- PostgreSQL database dump complete
--

