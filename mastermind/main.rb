# Constantes
COLOR_EMOJIS = {
  red: "🔴",
  blue: "🔵",
  pink: "🌸",
  yellow: "🟡",
  green: "🟢"
}
VALID_LETTERS = COLOR_EMOJIS.keys.map { |color| color[0] }

TIPS = <<~TIPS
===================================================================================================
  Bem-vindo ao Mastermind!
  - O computador irá gerar um código secreto composto por 4 cores.
  - Seu objetivo é adivinhar a sequência correta de cores.
  - As cores disponíveis são: #{COLOR_EMOJIS.map { |color, emoji| "#{emoji} (#{color})" }.join(', ')}.
  - Após cada tentativa, você receberá um feedback:
    - Cor correta na posição correta. 🔥
    - Cor correta na posição errada. 💧
  - Você tem um número limitado de tentativas. Boa sorte!
TIPS

TURN_TIP = <<~TURNTIP
===================================================================================================
Digite sua tentativa usando a primeira letra de cada cor.
Por exemplo, para vermelho, azul, amarelo e rosa:

🔴 🔵 🟡 🌸
r b y p
TURNTIP

# Métodos
def create_pass
  COLOR_EMOJIS.keys.sample(4)
end

def valid_guess?(guess)
  guess.chars.all? { |char| VALID_LETTERS.include?(char) } && guess.size == 4
end

def parse_guess(guess)
  guess.chars.map { |char| COLOR_EMOJIS.keys.find { |color| color[0].to_s == char } }
end

def display_memory(memory)
  memory.map { |turn| turn.join(' ') }.join("\n")
end

def display_result(memory, password)
  <<~RESULT
  ===================================================================================================
  | Resultado
  ===================================================================================================
  TENTATIVAS:
  #{display_memory(memory)}

  SEGREDO:
  #{password.map { |color| COLOR_EMOJIS[color] }.join(' ')}
  RESULT
end

def check_guessing(guessing, password)
  feedback = []
  temp_password = password.dup

  # Verificar cor correta e posição correta
  guessing.each_with_index do |color, index|
    if color == temp_password[index]
      feedback << "🔥"
      temp_password[index] = nil
    end
  end

  # Verificar cor correta mas posição errada
  guessing.each_with_index do |color, index|
    if temp_password.include?(color) && color != password[index]
      feedback << "💧"
      temp_password[temp_password.index(color)] = nil
    end
  end

  feedback
end

def play_game
  password = create_pass
  memory = []
  attempts = 0
  max_attempts = 5

  loop do
    system("clear") || system("cls") # Limpa a tela antes de cada turno
    puts TIPS
    puts TURN_TIP
    puts "Tentativas anteriores:\n#{display_memory(memory)}" unless memory.empty?

    print "Sua tentativa: "
    guessing_letters = gets.chomp.delete(' ')

    if valid_guess?(guessing_letters)
      guessing = parse_guess(guessing_letters)
      memory << [guessing.map { |color| COLOR_EMOJIS[color] }, check_guessing(guessing, password)]
      attempts += 1
      if guessing == password
        puts "Parabéns! Você adivinhou o código secreto!"
        break
      end
    else
      puts "\nEntrada inválida. Use apenas as primeiras letras das cores disponíveis: #{VALID_LETTERS.join(', ')}."
      next
    end

    if attempts >= max_attempts
      puts "Você atingiu o número máximo de tentativas!"
      break
    end
  end

  puts display_result(memory, password)
end

# Loop Principal do Jogo
play_game