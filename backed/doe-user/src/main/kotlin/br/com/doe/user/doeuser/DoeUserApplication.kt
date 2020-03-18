package br.com.doe.user.doeuser

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DoeUserApplication

fun main(args: Array<String>) {
	runApplication<DoeUserApplication>(*args)
}
