package br.com.doe.usecases

import br.com.doe.domain.User
import br.com.doe.gateway.repository.UserRepository
import org.springframework.stereotype.Component

@Component
class InsertUseCase(val userRepository: UserRepository) {

    fun execute(newUser: User) : User  = userRepository.save(newUser)

}