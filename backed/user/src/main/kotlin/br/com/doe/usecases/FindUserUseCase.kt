package br.com.doe.usecases

import br.com.doe.domain.User
import br.com.doe.gateway.repository.UserRepository
import org.springframework.data.crossstore.ChangeSetPersister
import org.springframework.stereotype.Component

@Component
class FindUserUseCase(val userRepository: UserRepository) {

    fun execute(email: String): User = userRepository.findById(email).orElseThrow {  ChangeSetPersister.NotFoundException() };

}