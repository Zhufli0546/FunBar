package tw.FunBar.chat;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import tw.FunBar.model.Member;


@Service("participantRepository")
public class ParticipantRepository {

	private Map<String, Member> activeSessions = new ConcurrentHashMap<>();

	public void add(String sessionId, Member event) {
		activeSessions.put(sessionId, event);
	}

	public Member getParticipant(String sessionId) {
		return activeSessions.get(sessionId);
	}

	public void removeParticipant(String sessionId) {
		activeSessions.remove(sessionId);
	}

	public Map<String, Member> getActiveSessions() {
		return activeSessions;
	}

	public void setActiveSessions(Map<String, Member> activeSessions) {
		this.activeSessions = activeSessions;
	}
}
