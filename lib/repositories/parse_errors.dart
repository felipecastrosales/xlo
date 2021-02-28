// ignore: avoid_classes_with_only_static_members
class ParseErrors {
  static final Map<int, String> _error = {
    -1: 'Erro desconhecido',
    1: 'Erro Interno do Servidor (InternalServerError)',
    100: 'Falha de conexão com o servidor (ConnectionFailed)',
    101: 'Usuário/senha inválido',
    102: 'Consulta inválida (InvalidQuery)',
    103: 'Nome da Classe inválida (InvalidClassName)',
    104: 'ID de objeto não encontrado (MissingObjectId)',
    105: 'Nome da chave inválida (InvalidKeyName)',
    106: 'Ponteiro inválido (InvalidPointer)',
    107: 'JSON inválido (InvalidJSON)',
    108: 'Recurso indisponível (CommandUnavailable)',
    109: 'Parse não inicializado (NotInitialized)',
    111: 'Campo com tipo incorreto (IncorrectType)',
    112: 'Canal inválido (InvalidChannelName)',
    115: 'Push configurado incorretamente (PushMisconfigured)',
    116: 'Objeto é muito grande (ObjectTooLarge)',
    119: 'Operação não é permitida para o Cliente (OperationForbidden)',
    120: 'Resultado não encontrado na cache (CacheMiss)',
    121: 'Chave inválida em um JSON (InvalidNestedKey)',
    122: 'Nome de arquivo inválido no ParseFile (InvalidFileName)',
    123: 'ACL inválida (InvalidACL)',
    124: 'Timeout (InvalidACL)',
    125: 'E-mail inválido',
    137: 'Valor duplicado para campo exclusivo',
    139: 'Nome da função inválido (InvalidRoleName)',
    140: 'Cota do aplicativo excedida (ExceededQuota)',
    141: 'Falha no script Cloudcode (ScriptFailed)',
    142: 'Falha na validação do Cloudcode (ValidationFailed)',
    153: 'Falha na exclusão do arquivo (FileDeleteFailed)',
    // ignore: lines_longer_than_80_chars
    155: 'O aplicativo excedeu seu limite de solicitação (RequestLimitExceeded)',
    160: 'Evento inválido (InvalidEventName)',
    200: 'Nome do usuário não foi preenchido',
    201: 'Senha não foi preenchida',
    202: 'E-mail informado já existe. Informe outro e-mail',
    203: 'E-mail informado já existe. Informe outro e-mail',
    204: 'E-mail não foi preenchido',
    205: 'E-mail não está cadastrado',
    206: 'Sessão inválida para alteração do usuário (SessionMissing)',
    207: 'Usuário só pode ser criado via Signup (MustCreateUserThroughSignup)',
    208: 'A conta informada já está vinculada com outro usuário',
    209: 'Sessão inválida (InvalidSessionToken)',
    // ignore: lines_longer_than_80_chars
    250: 'Usuário não pode ser vinculado a uma conta porque o ID não foi localizado (InvalidSessionToken)',
    // ignore: lines_longer_than_80_chars
    251: 'Usuário com conta vinculada está com sessão inválida (InvalidLinkedSession)',
    252: 'Serviço que está sendo vinculado não é suportado (UnsupportedService)'
  };

  static String getDescription(int error) {
    return _error[error];
  }
}
