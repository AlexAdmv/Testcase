#!/bin/bash
BEARER="$(curl -X POST -H "Content-Type: application/json" -d '{"name":"apikeycurl", "role": "Admin"}' http://admin:admin@192.168.10.6:3000/api/auth/keys | jq -r '.key')"
curl -X POST -H 'Content-Type: application/json;charset=UTF-8' --data-binary '{"name":"grafana","type":"influxdb","url":"http://192.168.10.6:8086","access":"proxy","isDefault":true,"database":"grafana","user":"admin","password":"admin"}' http://admin:admin@192.168.10.6:3000/api/datasources
curl -X POST --insecure -H "Authorization: Bearer ${BEARER}" -H "Content-Type: application/json" -d '{
	"dashboard": {
		  "annotations": {
			"list": [
			  {
				"builtIn": 1,
				"datasource": "-- Grafana --",
				"enable": true,
				"hide": true,
				"iconColor": "rgba(0, 211, 255, 1)",
				"name": "Annotations & Alerts",
				"type": "dashboard"
			  }
			]
		  },
		  "description": "",
		  "editable": true,
		  "gnetId": 554,
		  "graphTooltip": 1,
		  "hideControls": false,
		  "id": null,
		  "links": [],
		  "refresh": false,
		  "rows": [
			{
			  "collapse": false,
			  "height": "250px",
			  "panels": [
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "editable": true,
				  "error": false,
				  "fill": 1,
				  "grid": {},
				  "id": 5,
				  "legend": {
					"alignAsTable": true,
					"avg": true,
					"current": false,
					"hideZero": true,
					"max": true,
					"min": true,
					"rightSide": true,
					"show": true,
					"total": false,
					"values": true
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "idle",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "idle"
						}
					  ]
					},
					{
					  "alias": "iowait",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "C",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "wait"
						}
					  ]
					},
					{
					  "alias": "irq",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "D",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "interrupt"
						}
					  ]
					},
					{
					  "alias": "nice",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "E",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "nice"
						}
					  ]
					},
					{
					  "alias": "softirq",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "F",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "softirq"
						}
					  ]
					},
					{
					  "alias": "steal",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "G",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "steal"
						}
					  ]
					},
					{
					  "alias": "system",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "H",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "system"
						}
					  ]
					},
					{
					  "alias": "user",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "cpu_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "I",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "user"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "CPU Usage",
				  "tooltip": {
					"msResolution": true,
					"shared": true,
					"sort": 0,
					"value_type": "cumulative"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				},
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "editable": true,
				  "error": false,
				  "fill": 1,
				  "grid": {},
				  "id": 6,
				  "legend": {
					"alignAsTable": true,
					"avg": true,
					"current": false,
					"max": true,
					"min": true,
					"rightSide": true,
					"show": true,
					"total": false,
					"values": true
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "short",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "load_shortterm",
					  "policy": "default",
					  "refId": "A",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						}
					  ]
					},
					{
					  "alias": "medium",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "load_midterm",
					  "policy": "default",
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						}
					  ]
					},
					{
					  "alias": "long",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "load_longterm",
					  "policy": "default",
					  "refId": "C",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "Load Average",
				  "tooltip": {
					"msResolution": true,
					"shared": true,
					"sort": 0,
					"value_type": "cumulative"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				},
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "editable": true,
				  "error": false,
				  "fill": 1,
				  "grid": {},
				  "id": 7,
				  "legend": {
					"avg": false,
					"current": false,
					"max": false,
					"min": false,
					"show": true,
					"total": false,
					"values": false
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "used",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "memory_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "query": "SELECT mean(\"value\") FROM \"memory_value\" WHERE \"host\" =~ /^$host$/ AND \"type_instance\" = used AND $timeFilter GROUP BY time($interval) fill(null)",
					  "rawQuery": false,
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "used"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "Memory",
				  "tooltip": {
					"msResolution": true,
					"shared": true,
					"sort": 0,
					"value_type": "cumulative"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "bytes",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				},
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "editable": true,
				  "error": false,
				  "fill": 1,
				  "grid": {},
				  "id": 8,
				  "legend": {
					"avg": false,
					"current": false,
					"max": false,
					"min": false,
					"show": true,
					"total": false,
					"values": false
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "free",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "memory_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "free"
						}
					  ]
					},
					{
					  "alias": "buffered",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "memory_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "C",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "buffered"
						}
					  ]
					},
					{
					  "alias": "cached",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "memory_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "D",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "cached"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "Memory Distribution",
				  "tooltip": {
					"msResolution": true,
					"shared": true,
					"sort": 0,
					"value_type": "cumulative"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "bytes",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				},
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "decimals": 1,
				  "editable": true,
				  "error": false,
				  "fill": 1,
				  "grid": {},
				  "id": 15,
				  "legend": {
					"avg": false,
					"current": false,
					"max": false,
					"min": false,
					"show": true,
					"total": false,
					"values": false
				  },
				  "lines": true,
				  "linewidth": 2,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "free",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "df_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "A",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "last"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "free"
						},
						{
						  "condition": "AND",
						  "key": "type",
						  "operator": "=",
						  "value": "df_complex"
						},
						{
						  "condition": "AND",
						  "key": "instance",
						  "operator": "=",
						  "value": "boot"
						}
					  ]
					},
					{
					  "alias": "used",
					  "dsType": "influxdb",
					  "expr": "",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "intervalFactor": 2,
					  "measurement": "df_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "last"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "used"
						},
						{
						  "condition": "AND",
						  "key": "type",
						  "operator": "=",
						  "value": "df_complex"
						},
						{
						  "condition": "AND",
						  "key": "instance",
						  "operator": "=",
						  "value": "root"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "Disk space (/)",
				  "tooltip": {
					"msResolution": true,
					"shared": true,
					"sort": 0,
					"value_type": "cumulative"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "bytes",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": 0,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				},
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": "grafana",
				  "fill": 1,
				  "id": 16,
				  "legend": {
					"avg": false,
					"current": false,
					"max": false,
					"min": false,
					"show": true,
					"total": false,
					"values": false
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "connected",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "Read",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "hide": false,
					  "measurement": "disk_read",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "query": "SELECT non_negative_derivative(mean(\"value\"), 1s) FROM \"disk_read\" WHERE (\"host\" =~ /^$host$/ AND \"type\" = disk_ops AND \"instance\" =~ /^$device$/) AND $timeFilter GROUP BY time($interval) fill(null)",
					  "rawQuery": false,
					  "refId": "A",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type",
						  "operator": "=",
						  "value": "disk_ops"
						},
						{
						  "condition": "AND",
						  "key": "instance",
						  "operator": "=~",
						  "value": "/^$device$/"
						}
					  ]
					},
					{
					  "alias": "Write",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "hide": false,
					  "measurement": "disk_write",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "query": "SELECT non_negative_derivative(mean(\"value\"), 1s) FROM \"disk_write\" WHERE (\"host\" =~ /^$host$/ AND \"type\" = disk_ops AND \"instance\" =~ /^$device$/) AND $timeFilter GROUP BY time($interval) fill(null)",
					  "rawQuery": false,
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type",
						  "operator": "=",
						  "value": "disk_ops"
						},
						{
						  "condition": "AND",
						  "key": "instance",
						  "operator": "=~",
						  "value": "/^$device$/"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "IOPS",
				  "tooltip": {
					"shared": true,
					"sort": 0,
					"value_type": "individual"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "iops",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				}
			  ],
			  "repeat": null,
			  "repeatIteration": null,
			  "repeatRowId": null,
			  "showTitle": false,
			  "title": "Row",
			  "titleSize": "h6"
			},
			{
			  "collapse": false,
			  "height": 250,
			  "panels": [
				{
				  "aliasColors": {},
				  "bars": false,
				  "dashLength": 10,
				  "dashes": false,
				  "datasource": null,
				  "fill": 1,
				  "id": 17,
				  "legend": {
					"avg": false,
					"current": false,
					"max": false,
					"min": false,
					"show": true,
					"total": false,
					"values": false
				  },
				  "lines": true,
				  "linewidth": 1,
				  "links": [],
				  "nullPointMode": "null",
				  "percentage": false,
				  "pointradius": 5,
				  "points": false,
				  "renderer": "flot",
				  "seriesOverrides": [],
				  "spaceLength": 10,
				  "span": 6,
				  "stack": false,
				  "steppedLine": false,
				  "targets": [
					{
					  "alias": "Handled",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$__interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "measurement": "nginx_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "query": "SELECT non_negative_derivative(mean(\"value\"), 1s) FROM \"nginx_value\" WHERE (\"host\" =~ /^$host$/ AND \"type_instance\" = 'handled') AND $timeFilter GROUP BY time($__interval) fill(null)",
					  "rawQuery": false,
					  "refId": "A",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "handled"
						}
					  ]
					},
					{
					  "alias": "Reading",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$__interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "measurement": "nginx_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "B",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "reading"
						}
					  ]
					},
					{
					  "alias": "Writing",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$__interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "measurement": "nginx_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "C",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "writing"
						}
					  ]
					},
					{
					  "alias": "Waiting",
					  "dsType": "influxdb",
					  "groupBy": [
						{
						  "params": [
							"$__interval"
						  ],
						  "type": "time"
						},
						{
						  "params": [
							"null"
						  ],
						  "type": "fill"
						}
					  ],
					  "measurement": "nginx_value",
					  "orderByTime": "ASC",
					  "policy": "default",
					  "refId": "D",
					  "resultFormat": "time_series",
					  "select": [
						[
						  {
							"params": [
							  "value"
							],
							"type": "field"
						  },
						  {
							"params": [],
							"type": "mean"
						  },
						  {
							"params": [
							  "1s"
							],
							"type": "non_negative_derivative"
						  }
						]
					  ],
					  "tags": [
						{
						  "key": "host",
						  "operator": "=~",
						  "value": "/^$host$/"
						},
						{
						  "condition": "AND",
						  "key": "type_instance",
						  "operator": "=",
						  "value": "waiting"
						}
					  ]
					}
				  ],
				  "thresholds": [],
				  "timeFrom": null,
				  "timeShift": null,
				  "title": "Nginx Connections",
				  "tooltip": {
					"shared": true,
					"sort": 0,
					"value_type": "individual"
				  },
				  "type": "graph",
				  "xaxis": {
					"buckets": null,
					"mode": "time",
					"name": null,
					"show": true,
					"values": []
				  },
				  "yaxes": [
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					},
					{
					  "format": "short",
					  "label": null,
					  "logBase": 1,
					  "max": null,
					  "min": null,
					  "show": true
					}
				  ]
				}
			  ],
			  "repeat": null,
			  "repeatIteration": null,
			  "repeatRowId": null,
			  "showTitle": false,
			  "title": "Dashboard Row",
			  "titleSize": "h6"
			}
		  ],
		  "schemaVersion": 14,
		  "style": "dark",
		  "tags": [
			"CPU",
			"LA",
			"MEM",
			"IOPS",
			"NGINX"
		  ],
		  "templating": {
			"list": [
			  {
				"current": {
				  "text": "grafana",
				  "value": "grafana"
				},
				"datasource": null,
				"hide": 0,
				"includeAll": false,
				"label": "",
				"multi": false,
				"name": "datasource",
				"options": [],
				"query": "influxdb",
				"refresh": 1,
				"regex": "",
				"type": "datasource"
			  },
			  {
				"allValue": null,
				"current": {
				  "text": "app1",
				  "value": "app1"
				},
				"datasource": "grafana",
				"hide": 0,
				"includeAll": false,
				"label": null,
				"multi": false,
				"name": "host",
				"options": [],
				"query": "SHOW TAG VALUES WITH KEY=host",
				"refresh": 1,
				"regex": "",
				"sort": 0,
				"tagValuesQuery": "",
				"tags": [],
				"tagsQuery": "",
				"type": "query",
				"useTags": false
			  },
			  {
				"allValue": null,
				"current": {
				  "tags": [],
				  "text": "sda",
				  "value": "sda"
				},
				"datasource": "grafana",
				"hide": 0,
				"includeAll": false,
				"label": null,
				"multi": false,
				"name": "device",
				"options": [
				  {
					"selected": true,
					"text": "sda",
					"value": "sda"
				  },
				  {
					"selected": false,
					"text": "sda1",
					"value": "sda1"
				  },
				  {
					"selected": false,
					"text": "sda2",
					"value": "sda2"
				  },
				  {
					"selected": false,
					"text": "sda3",
					"value": "sda3"
				  }
				],
				"query": "SHOW TAG VALUES FROM \"disk_read\" WITH KEY = \"instance\"",
				"refresh": 0,
				"regex": "",
				"sort": 0,
				"tagValuesQuery": "",
				"tags": [],
				"tagsQuery": "",
				"type": "query",
				"useTags": false
			  }
			]
		  },
		  "time": {
			"from": "now-1h",
			"to": "now"
		  },
		  "timepicker": {
			"refresh_intervals": [
			  "5s",
			  "10s",
			  "30s",
			  "1m",
			  "5m",
			  "15m",
			  "30m",
			  "1h",
			  "2h",
			  "1d"
			],
			"time_options": [
			  "5m",
			  "15m",
			  "1h",
			  "6h",
			  "12h",
			  "24h",
			  "2d",
			  "7d",
			  "30d"
			]
		  },
		  "timezone": "browser",
		  "title": "Host Metrics",
		  "version": 8
		},
				"overwrite": false
			  }' http://192.168.10.6:3000/api/dashboards/db