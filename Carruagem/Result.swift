/// Resposta de um método que pode resultar em falha ou sucesso
public enum Result<T> {
    case success(T)
    case failure(Error)
}
