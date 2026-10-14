import http from 'k6/http';
import { sleep, check } from 'k6';

export let options = {
	stages: [
		{ duration: '30s', target: 50 },
		{ duration: '1m', target: 50 },
		{ duration: '30s', target: 0 },
	],
	thresholds: {
		'http_req_duration': ['p(95)<500'],
	},
};

const BASE_URL = __ENV.BASE_URL || 'http://localhost:9090';

export default function () {
	const res = http.get(`${BASE_URL}/`);
	check(res, {
		'status is 200': (r) => r.status === 200,
		'body size > 0': (r) => r.body && r.body.length > 0,
	});
	sleep(1);
}
