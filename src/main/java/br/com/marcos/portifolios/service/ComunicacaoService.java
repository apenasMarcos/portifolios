package br.com.marcos.portifolios.service;

import br.com.marcos.portifolios.model.form.MensagemForm;

public interface ComunicacaoService {
    void salvarMensagemQueue(MensagemForm email);
    void enviarWhatsapp(String mensagem);

    void salvarMensagem(MensagemForm form);
}
