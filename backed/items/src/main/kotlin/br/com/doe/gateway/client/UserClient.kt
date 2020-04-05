package br.com.doe.gateway.client

import org.springframework.cloud.openfeign.FeignClient

@FeignClient(value = "user", url = "http://jsonplaceholder.typicode.com/")
interface UserClient {
}