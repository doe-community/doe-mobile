package br.com.doe

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.openfeign.EnableFeignClients

@SpringBootApplication
@EnableFeignClients
class ItemsApplication

fun main(args: Array<String>) {
	runApplication<ItemsApplication>(*args)
}